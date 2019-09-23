Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8FAF87BD72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 18:27:23 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id b19so35938444iob.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 11:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pZL1rffqP/Q/csUk/yKPoGv+AfNMPkNOcGhSc5EXFl0=;
	b=uwlTw1O7xdTyGFlzws2Fu5YZCe9oRULcosIS09GPIwsf5FWfxQ5fYPk7rsT9K1TBsG
	BffWEYo2pmSjj1GLIvaURtnWw9ck+7N48gX3joymnrnEjLycqiCZTNvAKgb7A32eADJn
	MZeEu0eJc4UDV38YCvyXmbm6eNySzALR/pZAiITqZygfB7bVBHv6t5EcGsuReLekl8FA
	Y8kiwzGcj7My+fBKF1Yxe3OKCW3RG10xAWbH6j7acTIyHBIO3sOebTjF6lYeH8dLEQtG
	DO2axCrPiSQr+zHlMdFGnH1oeRwMht+CMj211rgrKhDzxEepqMc4se2wlR6+ujwx8N/s
	xerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pZL1rffqP/Q/csUk/yKPoGv+AfNMPkNOcGhSc5EXFl0=;
	b=lwAuOwpS0PlXdlHgRI0GKKxSfrCWy4R2SspiYlOo5jSW1gIwSrD7013TmrkNmEarwj
	olfdx5QGy2uECe4Q3fJDWadZpdXW3O97QmU4jRVjejXGAK15mc5YjtEtMFnOomUfRYZ2
	l6yzQtpqviO7Ww710mXUzt1zDbOd4ZqnHrJ0wzi/IuOQZCCnyCZR54XKXxwN6DXXgbjU
	vxWqP4bSKd4q72aud60yqtgdpta+RQk07tzzTcwVHaVbYcKw8xgb53ND02yThe7l4rIz
	bl77PWZJ1Iv4b3Shg/9h3lLxkXsGm52iRrUCsg8WE7wRvYvix9LqPHDeZKWdDr3T/WOo
	brMA==
X-Gm-Message-State: APjAAAV5ADgSMdH2h7bCJ5PfWs7YCIVO+F9FNWyxh0eF8+VpVk2EjqPI
	PcLDQrzRexY2VnblX10scPFDt2Fka7X9MF1O5kU=
X-Google-Smtp-Source: APXvYqwrBZ1tRxmczlM8CEjXlK6z3j759KhyVCcqjE+aSUc9XQ7MfGx/DMit0Z+iHODpljQjC5q1P39cErf8JLGGkZA=
X-Received: by 2002:a5d:97cf:: with SMTP id k15mr692077ios.151.1569263244419; 
	Mon, 23 Sep 2019 11:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190923155238.31958-1-Trevor.Gamblin@windriver.com>
	<CANx9H-A2D-sAhKW7YaXnG0E1wg5odcOWubA=BbqwK85XD6nC7A@mail.gmail.com>
	<bbce0fcf-84aa-7b34-b07a-bcd598447f22@windriver.com>
In-Reply-To: <bbce0fcf-84aa-7b34-b07a-bcd598447f22@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 23 Sep 2019 11:27:11 -0700
Message-ID: <CANx9H-Bt4hvdpbj4iKBSKDEHKkY5YBfgentUuE5bCf9xO_NuUw@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python3-subunit: ensure runtime dependencies are present
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
X-List-Received-Date: Mon, 23 Sep 2019 18:27:23 -0000
Content-Type: multipart/alternative; boundary="0000000000003e2ee805933c9251"

--0000000000003e2ee805933c9251
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 23, 2019 at 11:22 AM Trevor Gamblin <
trevor.gamblin@windriver.com> wrote:

> On 9/23/19 2:06 PM, Tim Orling wrote:
>
>
>
> On Mon, Sep 23, 2019 at 8:53 AM Trevor Gamblin <
> Trevor.Gamblin@windriver.com> wrote:
>
>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>> Without access to unittest, subunit cannot be imported in python3:
>>
>>     root@qemux86-64:~# python3
>>     Python 3.7.4 (default, Sep 20 2019, 13:38:31)
>>     [GCC 9.2.0] on linux
>>     Type "help", "copyright", "credits" or "license" for more information.
>>     >>> import subunit
>>     Traceback (most recent call last):
>>       File "<stdin>", line 1, in <module>
>>       File "/usr/lib/python3.7/site-packages/subunit/__init__.py", line
>> 123, in <module>
>>         import unittest
>>     ModuleNotFoundError: No module named 'unittest'
>>     >>>
>>
>> Adding python3-testtools to python3-subunit's RDEPENDS fixes the
>> issue. This also implicitly provides the functionality found in
>> the python3-extras module.
>>
>
> If we literally only need unittest, then RDEPENDS on -testtools is
> overkill. We only need the -unittest submodule:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/python3-manifest.json#n1158
>
> After running a quick test with python3-unittest and python3-extras as the
> RDEPENDS:
>
> root@qemux86-64:~#
> python3
>
> Python 3.7.4 (default, Sep 20 2019, 13:38:31)
> [GCC 9.2.0] on
> linux
>
> Type "help", "copyright", "credits" or "license" for more
> information.
> >>> import subunit
> Traceback (most recent call
> last):
>   File "<stdin>", line 1, in
> <module>
>
>   File "/usr/lib/python3.7/site-packages/subunit/__init__.py", line 130,
> in <module>
>     from testtools import content, content_type,
> ExtendedToOriginalDecorator
>
> ModuleNotFoundError: No module named 'testtools'
>
>
> It does require testtools, but the errors being thrown were for the
> unittest and extras modules (both included with testtools).
>
>
Thank you for the update.
+1

>
>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>  meta/recipes-devtools/python/python3-subunit_1.3.0.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
>> b/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
>> index 2ece4451df..55066e2d0f 100644
>> --- a/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
>> +++ b/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
>> @@ -1,2 +1,4 @@
>>  inherit setuptools3
>>  require python-subunit.inc
>> +
>> +RDEPENDS_${PN} = " python3-testtools"
>> --
>> 2.21.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--0000000000003e2ee805933c9251
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Sep 23, 2019 at 11:22 AM Trevor Gamblin &lt;<a href=3D"mailto:trevor=
.gamblin@windriver.com">trevor.gamblin@windriver.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>On 9/23/19 2:06 PM, Tim Orling wrote:<br>
    </p>
    <blockquote type=3D"cite">
     =20
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 23, 2019 at 8:5=
3
            AM Trevor Gamblin &lt;<a href=3D"mailto:Trevor.Gamblin@windrive=
r.com" target=3D"_blank">Trevor.Gamblin@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">From:
            Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.c=
om" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
            <br>
            Without access to unittest, subunit cannot be imported in
            python3:<br>
            <br>
            =C2=A0 =C2=A0 root@qemux86-64:~# python3<br>
            =C2=A0 =C2=A0 Python 3.7.4 (default, Sep 20 2019, 13:38:31)<br>
            =C2=A0 =C2=A0 [GCC 9.2.0] on linux<br>
            =C2=A0 =C2=A0 Type &quot;help&quot;, &quot;copyright&quot;, &qu=
ot;credits&quot; or &quot;license&quot; for
            more information.<br>
            =C2=A0 =C2=A0 &gt;&gt;&gt; import subunit<br>
            =C2=A0 =C2=A0 Traceback (most recent call last):<br>
            =C2=A0 =C2=A0 =C2=A0 File &quot;&lt;stdin&gt;&quot;, line 1, in=
 &lt;module&gt;<br>
            =C2=A0 =C2=A0 =C2=A0 File
            &quot;/usr/lib/python3.7/site-packages/subunit/__init__.py&quot=
;, line
            123, in &lt;module&gt;<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 import unittest<br>
            =C2=A0 =C2=A0 ModuleNotFoundError: No module named &#39;unittes=
t&#39;<br>
            =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
            <br>
            Adding python3-testtools to python3-subunit&#39;s RDEPENDS fixe=
s
            the<br>
            issue. This also implicitly provides the functionality found
            in<br>
            the python3-extras module.<br>
          </blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">If we literally only need unittest, then
            RDEPENDS on -testtools is overkill. We only need the
            -unittest submodule:</div>
          <div dir=3D"auto">
            <div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/=
tree/meta/recipes-devtools/python/python3/python3-manifest.json#n1158" targ=
et=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/reci=
pes-devtools/python/python3/python3-manifest.json#n1158</a></div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>After running a quick test with python3-unittest and
      python3-extras as the RDEPENDS:</p>
    <p>root@qemux86-64:~#
python3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0
      <br>
      Python 3.7.4 (default, Sep 20 2019, 13:38:31)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>
      [GCC 9.2.0] on
linux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      <br>
      Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or =
&quot;license&quot; for more
      information.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <br>
      &gt;&gt;&gt; import subunit=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>
      Traceback (most recent call
      last):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>
      =C2=A0 File &quot;&lt;stdin&gt;&quot;, line 1, in
&lt;module&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
      <br>
      =C2=A0 File &quot;/usr/lib/python3.7/site-packages/subunit/__init__.p=
y&quot;,
      line 130, in &lt;module&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>
      =C2=A0=C2=A0=C2=A0 from testtools import content, content_type,
ExtendedToOriginalDecorator=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      <br>
      ModuleNotFoundError: No module named &#39;testtools&#39;</p>
    <p><br>
    </p>
    <p>It does require testtools, but the errors being thrown were for
      the unittest and extras modules (both included with testtools).<br>
    </p></div><div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <blockquote type=3D"cite">
      <div>
        <div class=3D"gmail_quote">
          <div dir=3D"auto"></div></div></div></blockquote></div></blockquo=
te><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you for the update.<=
/div><div dir=3D"auto">+1</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div text=3D"=
#000000" bgcolor=3D"#FFFFFF"><blockquote type=3D"cite"><div><div class=3D"g=
mail_quote"><div dir=3D"auto"><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><br>
            Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamb=
lin@windriver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<b=
r>
            ---<br>
            =C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-su=
bunit_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-subunit_1.3.0.=
bb</a>
            | 2 ++<br>
            =C2=A01 file changed, 2 insertions(+)<br>
            <br>
            diff --git a/meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-subunit_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-subunit=
_1.3.0.bb</a>
            b/meta/recipes-devtools/python/<a href=3D"http://python3-subuni=
t_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-subunit_1.3.0.bb</=
a><br>
            index 2ece4451df..55066e2d0f 100644<br>
            --- a/meta/recipes-devtools/python/<a href=3D"http://python3-su=
bunit_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-subunit_1.3.0.=
bb</a><br>
            +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-su=
bunit_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-subunit_1.3.0.=
bb</a><br>
            @@ -1,2 +1,4 @@<br>
            =C2=A0inherit setuptools3<br>
            =C2=A0require python-subunit.inc<br>
            +<br>
            +RDEPENDS_${PN} =3D &quot; python3-testtools&quot;<br>
            -- <br>
            2.21.0<br>
            <br>
            -- <br>
            _______________________________________________<br>
            Openembedded-core mailing list<br>
            <a href=3D"mailto:Openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
            <a href=3D"http://lists.openembedded.org/mailman/listinfo/opene=
mbedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedde=
d.org/mailman/listinfo/openembedded-core</a><br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div></div>

--0000000000003e2ee805933c9251--
