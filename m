Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id C92D16B5C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 17:23:27 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so5145715pdj.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=zaRuSQr7sAHJtd6gDalroxMEqQ0ElXPClNrUakP5yIs=;
	b=MkaHHE+iD1GOfRyx9IhrrZOm2OI04AxTHFBVJaBb7MSuAKKPRQnCgNP0B8ykHFpp8g
	iec5lpOmy6ye4mr9MZg5XIBaL+BVUW5VVkIQp9Q29D2ojguhs6goPegF8eDdJDcCoIUn
	tfras+zaNjB2cWGPQ9gr3T0w3XOEPM1JglLgYEfdmTaFRpb+MI0x4kHTRmcvKcAxzs6B
	ACdiXNVT2i2k8yIyrz1qe5q2lFi9FcywgdbFNxyNJCnHiFuspfSaST6jQG1f/7FdjpTR
	cedNvh0353AJgqj6ojfso8HAFA6AVxZSCIJQaUFJAAYAILX4d3wQDaCjS52wCd/36ykP
	tzyA==
X-Gm-Message-State: ALoCoQlsBC+dHVwmh/OMfsWIMtTYpjFVJqnHubWk4fiLSUNjNPp3TzR6PW2BUzQNfis/HHRfdoE5
MIME-Version: 1.0
X-Received: by 10.66.27.143 with SMTP id t15mr3045029pag.171.1376414608700;
	Tue, 13 Aug 2013 10:23:28 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Tue, 13 Aug 2013 10:23:28 -0700 (PDT)
In-Reply-To: <CAOMwXhP2nK2kjwseLjH0G-Wc9u20cOms-TWbF7zpYrya-GX8=w@mail.gmail.com>
References: <1376413879-9809-1-git-send-email-sgw@linux.intel.com>
	<CAOMwXhP2nK2kjwseLjH0G-Wc9u20cOms-TWbF7zpYrya-GX8=w@mail.gmail.com>
Date: Tue, 13 Aug 2013 18:23:28 +0100
X-Google-Sender-Auth: UzQcKA3Vf5vya2WmRjxOyIq2I_s
Message-ID: <CAOMwXhNFwVwt4G_v-SMMph=J3zvv=Z6Jh=LvEKZGVO=_zpChrg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] meta-skeleton: Add busybox config fragment example
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
X-List-Received-Date: Tue, 13 Aug 2013 17:23:27 -0000
Content-Type: multipart/alternative; boundary=bcaec52bea19d0cfc204e3d77f63

--bcaec52bea19d0cfc204e3d77f63
Content-Type: text/plain; charset=ISO-8859-1

s/which files/which lines/


On Tue, Aug 13, 2013 at 6:23 PM, Laszlo Papp <lpapp@kde.org> wrote:

> How will this know which files exactly to disregard in the busybox include
> file (".inc")?
>
> Could you please give that to the commit message as explanation?
>
>
> On Tue, Aug 13, 2013 at 6:11 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> This shows an example of the config fragment support that
>> both the linux-yocto and busybox recipes use. This example
>> is specific to busybox.
>>
>> By adding busybox CONFIG options into a .cfg file and then
>> adding that .cfg file to SRC_URI the merge_config.sh script will
>> correctly handle these CONFIG options during the do_configure task.
>>
>> v2: fixed FILESEXTRAPATHS
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>  meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg   | 1 +
>>  meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend | 5 +++++
>>  2 files changed, 6 insertions(+)
>>  create mode 100644
>> meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
>>  create mode 100644
>> meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
>>
>> diff --git a/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
>> b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
>> new file mode 100644
>> index 0000000..42c6730
>> --- /dev/null
>> +++ b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
>> @@ -0,0 +1 @@
>> +CONFIG_RFKILL=n
>> diff --git a/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
>> b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
>> new file mode 100644
>> index 0000000..641f04a4
>> --- /dev/null
>> +++ b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
>> @@ -0,0 +1,5 @@
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> +
>> +SRC_URI += " \
>> +           file://no_rfkill.cfg \
>> +           "
>> --
>> 1.8.1.4
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--bcaec52bea19d0cfc204e3d77f63
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">s/which files/which lines/</div><div class=3D"gmail_extra"=
><br><br><div class=3D"gmail_quote">On Tue, Aug 13, 2013 at 6:23 PM, Laszlo=
 Papp <span dir=3D"ltr">&lt;<a href=3D"mailto:lpapp@kde.org" target=3D"_bla=
nk">lpapp@kde.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">How will this know which fi=
les exactly to disregard in the busybox include file (&quot;.inc&quot;)?<di=
v>
<br></div><div>Could you please give that to the commit message as explanat=
ion?</div></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail=
_extra">
<br><br><div class=3D"gmail_quote">On Tue, Aug 13, 2013 at 6:11 PM, Saul Wo=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_=
blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">

<div>This shows an example of the config fragment support that<br>
both the linux-yocto and busybox recipes use. This example<br>
is specific to busybox.<br>
<br>
By adding busybox CONFIG options into a .cfg file and then<br>
adding that .cfg file to SRC_URI the merge_config.sh script will<br>
correctly handle these CONFIG options during the do_configure task.<br>
<br>
</div>v2: fixed FILESEXTRAPATHS<br>
<div><br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com" target=
=3D"_blank">sgw@linux.intel.com</a>&gt;<br>
---<br>
=A0meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg =A0 | 1 +<br>
=A0meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend | 5 +++++<br>
=A02 files changed, 6 insertions(+)<br>
=A0create mode 100644 meta-skeleton/recipes-core/busybox/busybox/no_rfkill.=
cfg<br>
=A0create mode 100644 meta-skeleton/recipes-core/busybox/busybox_1.21.1.bba=
ppend<br>
<br>
diff --git a/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg b/met=
a-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg<br>
new file mode 100644<br>
index 0000000..42c6730<br>
--- /dev/null<br>
+++ b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg<br>
@@ -0,0 +1 @@<br>
+CONFIG_RFKILL=3Dn<br>
diff --git a/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend b/m=
eta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend<br>
new file mode 100644<br>
index 0000000..641f04a4<br>
--- /dev/null<br>
+++ b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend<br>
@@ -0,0 +1,5 @@<br>
</div>+FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
<div><div>+<br>
+SRC_URI +=3D &quot; \<br>
+ =A0 =A0 =A0 =A0 =A0 file://no_rfkill.cfg \<br>
+ =A0 =A0 =A0 =A0 =A0 &quot;<br>
--<br>
1.8.1.4<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--bcaec52bea19d0cfc204e3d77f63--
