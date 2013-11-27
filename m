Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id B6B866DCE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 15:44:01 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id at1so11862373iec.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 07:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=czyUQU2eoiD0lPZDBcY8oNNB8U4GPt7nTXcYDCNXgDg=;
	b=AmxFWi1hfaIediAt7GxTKg2+6/rFQztVDVzG4X+x5QsT84nW9k1hIuPxKA2+jYRsB6
	fApppw5jeKXTHJGl8fBEUm5a4iZZLWHLwnKBIEBmWPFQy13Y7xeJe1ObdSQ3Ri9TCb//
	fmXV1abNUQu7XDnnAWjaX01X/D6did7Uqnd3xYEz/xr/7WV56e/eAktuo9XIn0mCRKz9
	kDv1Y3HubydHYWilcevLdRJMVeDNMvXjTCdfG2ARrn2ugwf8SZ1F9K8ZE9bCrnrPFKTD
	EDsSWwMNju/Go3ujb+ieW+T2peS/PXuds4TWKjF5fpWQ6nYmL4ExDeUf+9cgyfuvB+Fd
	bPNw==
MIME-Version: 1.0
X-Received: by 10.43.17.196 with SMTP id qd4mr9656896icb.44.1385567041594;
	Wed, 27 Nov 2013 07:44:01 -0800 (PST)
Received: by 10.50.79.167 with HTTP; Wed, 27 Nov 2013 07:44:01 -0800 (PST)
In-Reply-To: <5295F7CF.2000506@windriver.com>
References: <1385559942.11222.1.camel@ted>
	<5295F7CF.2000506@windriver.com>
Date: Wed, 27 Nov 2013 07:44:01 -0800
Message-ID: <CAMKF1so9oGrxMDrNPT057b7Bqa__YdPhx7t_pM35KbxaNzGwTw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] module-base: Fix misleading comment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Nov 2013 15:44:01 -0000
Content-Type: multipart/alternative; boundary=bcaec5186d4453af2204ec2a779b

--bcaec5186d4453af2204ec2a779b
Content-Type: text/plain; charset=UTF-8

On Wednesday, November 27, 2013, Bruce Ashfield wrote:

> On 13-11-27 08:45 AM, Richard Purdie wrote:
>
>> The comment was originally written for module.bbclass and is now
>> slightly misleading. This updates it to match the current code.
>>
>
> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>


Looks ok

>
>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.
>> bbclass
>> index 9dbb4b4..1589a90 100644
>> --- a/meta/classes/module-base.bbclass
>> +++ b/meta/classes/module-base.bbclass
>> @@ -11,11 +11,8 @@ KERNEL_OBJECT_SUFFIX = ".ko"
>>   # kernel modules are generally machine specific
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>
>> -#
>> -# Ensure the hostprogs are available for module compilation. Modules that
>> -# inherit this recipe and override do_compile() should be sure to call
>> -# do_make_scripts() or ensure the scripts are built independently.
>> -#
>> +# Function to ensure the kernel scripts are created. Expected to
>> +# be called before do_compile. See module.bbclass for an exmaple.
>>   do_make_scripts() {
>>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>>         make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
>>
>>
>>
>

--bcaec5186d4453af2204ec2a779b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, November 27, 2013, Bruce Ashfield  wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On 13-11-27 08:45 AM, Richard Purdie wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The comment was originally written for module.bbclass and is now<br>
slightly misleading. This updates it to match the current code.<br>
</blockquote>
<br>
Acked-by: Bruce Ashfield &lt;<a>bruce.ashfield@windriver.com</a>&gt;</block=
quote><div><br></div><div>Looks ok=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Richard Purdie &lt;<a>richard.purdie@linuxfoundation.org</a>=
&gt;<br>
---<br>
diff --git a/meta/classes/module-base.<u></u>bbclass b/meta/classes/module-=
base.<u></u>bbclass<br>
index 9dbb4b4..1589a90 100644<br>
--- a/meta/classes/module-base.<u></u>bbclass<br>
+++ b/meta/classes/module-base.<u></u>bbclass<br>
@@ -11,11 +11,8 @@ KERNEL_OBJECT_SUFFIX =3D &quot;.ko&quot;<br>
=C2=A0 # kernel modules are generally machine specific<br>
=C2=A0 PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<br>
-#<br>
-# Ensure the hostprogs are available for module compilation. Modules that<=
br>
-# inherit this recipe and override do_compile() should be sure to call<br>
-# do_make_scripts() or ensure the scripts are built independently.<br>
-#<br>
+# Function to ensure the kernel scripts are created. Expected to<br>
+# be called before do_compile. See module.bbclass for an exmaple.<br>
=C2=A0 do_make_scripts() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;$=
{KERNEL_LD}&quot; AR=3D&quot;${KERNEL_AR}&quot; \<br>
<br>
<br>
</blockquote>
<br>
</blockquote>

--bcaec5186d4453af2204ec2a779b--
