Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id F124B77527
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 12:48:01 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id 16so220949qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 05:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uUOfI7R8IbySFSFoHPT8gVFg45Z4tp5lVUa49oc9lMA=;
	b=hDrenVatyXojCanaG3RmzfvXmZDA6vA/7nQW1lcKlus4a7JJ/AdGsRkj+omfNk+D8V
	ffw7qHbVX3CR36Iigf7OhKas36buXfz/oKOjIQd05OYLBpbzth8LuNOUAtFhMjyZgGiM
	DRX22uA0KtZoFIyfuNimt+kOh+sEBzTppjjL0DF8aqZgTF7C7K8NYs0jB4dEfT3RdGHc
	oKs/OBhCiV1lLpb643ddNfy00A3wCHxdvmS7aTINy4N/T3GSGIIf8MZshzkclNhdjBtK
	8k3pSNWoegHxFv3k3nSFmBJJX5Xcb4YIVicKViDcEkIxYuY0C7QdG1AZL93ETFCOKdxh
	TKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uUOfI7R8IbySFSFoHPT8gVFg45Z4tp5lVUa49oc9lMA=;
	b=Pg3kJkg+ZQmR1OQXQD5sNbmQ2QwfvTvrWRVLs9IG/TFo+W0Eshukkz1uIQYy6JnxRe
	8w8v5dgXMlwe0qHgt9W4jWkj6qhgXiKz1KEclIZ2WU8NNpzH8azN1tuPHWmdApTkLs5e
	694qwrZc4XJUIViqv0pzXN70eqnQsMXzAGIcDYbelz574/Vkd1SvRMx+RVLB8u6xQOfC
	mNVro2/ktXWuRDdoWAX6Uv1kmj/KIN8BYZ17rx0sy0spm4rxbHBb+AiTtvLz5i4w3GEc
	vNSeWu7hrKqpUYUEqQ2ShzQUqwQvFWOaCkZ4T8rxmgup5f+Qlk+48g0h5H+OV/bhY5Rn
	H1HQ==
X-Gm-Message-State: AKS2vOzXqvEz1ChwUwg6vCXjiJWQycBp5znReTrXUO2EmSOoRMeOpOu0
	v6zWXMdFfluZeToIWKtAB40N+xq7XS65
X-Received: by 10.55.128.130 with SMTP id b124mr7145qkd.109.1498481282911;
	Mon, 26 Jun 2017 05:48:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Mon, 26 Jun 2017 05:47:42 -0700 (PDT)
In-Reply-To: <CAJTo0LaHyV2TnS8ePj7V0oidenTweVQTmLgMvfu8D6NZ=7DYDw@mail.gmail.com>
References: <56128a61-8244-9586-0fef-2cead1dd97d7@yadro.com>
	<CAJTo0Lb55gNRVebzugqaaEY7tbhSUG3+1NBrsEfw-7VZW_Vv+A@mail.gmail.com>
	<a2f5de2a-eab8-ae39-cb2f-d54867def27a@yadro.com>
	<CAJTo0LaHyV2TnS8ePj7V0oidenTweVQTmLgMvfu8D6NZ=7DYDw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Jun 2017 13:47:42 +0100
Message-ID: <CAJTo0LYWXH=K27gtvCh4r3rwCiE9a9Y30JKS+OYqAZVMYsoGQw@mail.gmail.com>
To: Anton Novikov <a.novikov@yadro.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] (master) automake: fix Perl regex
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
X-List-Received-Date: Mon, 26 Jun 2017 12:48:02 -0000
Content-Type: multipart/alternative; boundary="94eb2c05f82292265b0552dc5c81"

--94eb2c05f82292265b0552dc5c81
Content-Type: text/plain; charset="UTF-8"

Whoops, hit sent too early.

If you want this also fixed in a stable branch, please cherry-pick and
submit the commit from master.

Ross

On 26 June 2017 at 13:46, Burton, Ross <ross.burton@intel.com> wrote:

> Actually looked at the patch: this has been fixed in master since oe-core
> 7fa044e799db651d45e4732e2527acfc2bc7cd47, which was committed in May.
>
> Ross
>
> On 26 June 2017 at 13:39, Anton Novikov <a.novikov@yadro.com> wrote:
>
>> Please reword it at will.
>>
>> Thanks,
>>
>> Anton
>>
>> On 06/26/2017 03:37 PM, Burton, Ross wrote:
>>
>> The subject needs to be of the form:
>>
>>   automake: fix perl regex for Perl 5.22 onwards
>>
>> Also the Upstream-Status can be set to Backport as this is sha 13f00eb4
>> upstream.
>>
>> Cheers,
>> Ross
>>
>> On 21 June 2017 at 09:55, Anton Novikov <a.novikov@yadro.com> wrote:
>>
>>> Thanks,
>>>
>>> Anton
>>>
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>
>>
>

--94eb2c05f82292265b0552dc5c81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Whoops, hit sent too early.<div><br></div><div>If you want=
 this also fixed in a stable branch, please cherry-pick and submit the comm=
it from master.</div><div><br></div><div>Ross</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On 26 June 2017 at 13:46, Burton, R=
oss <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr">Actually looked at the patch: this has been=
 fixed in master since oe-core=C2=A0<wbr>7fa044e799db651d45e4732e2527ac<wbr=
>fc2bc7cd47, which was committed in May.<span class=3D"HOEnZb"><font color=
=3D"#888888"><div><br></div><div>Ross</div></font></span></div><div class=
=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On 26 June 2017 at 13:39, Anton Novikov <span dir=3D"ltr">&lt;=
<a href=3D"mailto:a.novikov@yadro.com" target=3D"_blank">a.novikov@yadro.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Please reword it at will.</p>
    <p>Thanks,</p>
    <p>Anton<br>
    </p><div><div class=3D"m_3078674345440080647h5">
    <br>
    <div class=3D"m_3078674345440080647m_-6241998707143344283moz-cite-prefi=
x">On 06/26/2017 03:37 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">The subject needs to be of the form:
        <div><br>
        </div>
        <div>=C2=A0 automake: fix perl regex for Perl 5.22 onwards</div>
        <div><br>
        </div>
        <div>Also the Upstream-Status can be set to Backport as this is
          sha=C2=A013f00eb4 upstream.</div>
        <div><br>
        </div>
        <div>Cheers,</div>
        <div>Ross</div>
      </div>
      <div class=3D"gmail_extra"><br>
        <div class=3D"gmail_quote">On 21 June 2017 at 09:55, Anton Novikov
          <span dir=3D"ltr">&lt;<a href=3D"mailto:a.novikov@yadro.com" targ=
et=3D"_blank">a.novikov@yadro.com</a>&gt;</span>
          wrote:<br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Thanks,<br>
            <br>
            Anton<br>
            <br>
            <br>
            --<br>
            ______________________________<wbr>_________________<br>
            Openembedded-core mailing list<br>
            <a href=3D"mailto:Openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
            <a href=3D"http://lists.openembedded.org/mailman/listinfo/opene=
mbedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedde=
d.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
            <br>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--94eb2c05f82292265b0552dc5c81--
