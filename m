Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0F819783A1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 20:31:59 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id y15so8443906ita.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 12:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0ZKo6npYkwdDZiPtJLhnirLGKzFsm+K4JTxPyP69+xY=;
	b=Lhasti0zGQHBhAJfUPj/b8Me2PuTMANN7/tKXT7huBuh0VGNVcke5wAqYF3H3wmgJR
	QSXh+ygai5jbgFR2D9ru1NOik0rPIkDvKwSMONA8iEDY08kDYhvsw0AQUZAa0s9hOpeQ
	XBGFLXs021uzG6FZJeHCXlEuP81htaliyCBwaiXD3aZ4/NW+yz3X137lTwDkgvVso6Q2
	e7vYVQRZA934oJLHgqeC7Kl7fPKrSMnlunAWmMwkcwiLNtQOGi9HVYsn0qO4Iy4n6etL
	GGW6Ex1kebmM3yMi4efixpNZQ5s92gLnORqJaZweSztLdXjqEXsn94IF90F3TgOJ3y9N
	Mw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0ZKo6npYkwdDZiPtJLhnirLGKzFsm+K4JTxPyP69+xY=;
	b=PfPTFP1+Tf0QvpSpvw3XKNXZ45Ta7YAqKriSPoJDGcC9IjOeR6OeSrlL1ePK1S0qpU
	Nn8d4oKyOEmPUYI45hOFS6cs2MyxgeGovpQByGZ2nDJvRCIBteEAwQZGKXXmhTAUtDzQ
	IYAniACdn0a98gyjJZkUMqAFuXEesVkCjdbnIlqqpMmZbiAzHutIZH257RSxueY0e5dR
	L+hLB11cj+aXJSf+zWrHIrWGflVdrygsrhrAf2kbTtJrbVqX3qKFUamt4BjxUMsRFBIa
	uR5of5i0UXp4HYdI3SEHDQqEMjePxfG5/3wjx79XKQ7CFtdRr5hVkjV9lq5vIiF35kgV
	GwXA==
X-Gm-Message-State: AJaThX4OEnq7eNEWL6P9iLeqRoxZ7IVh0yzfrtcqDmNTiTPqNXfsA4xq
	Em8WtwYHiHipguItCrcSm3ubx892KFZDp/fV1zeEt8I6
X-Google-Smtp-Source: ABhQp+Ru7K8hqIzwpkUh1f9sAM+pqjWcE0SK63DFSgxLHbWxNJ9wyMBEZ1YZ6uGhFfu5mgy3W4VnGBSsYAaLuk8aZPY=
X-Received: by 10.36.87.207 with SMTP id u198mr2405215ita.108.1510173120898;
	Wed, 08 Nov 2017 12:32:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Wed, 8 Nov 2017 12:31:40 -0800 (PST)
In-Reply-To: <2eb1113b-b6c7-d4a4-5908-bf9ea2684513@xevo.com>
References: <20171016163143.22844-1-mkelly@xevo.com>
	<2eb1113b-b6c7-d4a4-5908-bf9ea2684513@xevo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Nov 2017 20:31:40 +0000
Message-ID: <CAJTo0LanJvP1g4SgKmh8dx-z4Y0qRJ9O6dk92OSJCoF_wLreiQ@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemctl-native: add target.wants to target regex
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
X-List-Received-Date: Wed, 08 Nov 2017 20:32:00 -0000
Content-Type: multipart/alternative; boundary="001a1143a75c6be296055d7e9462"

--001a1143a75c6be296055d7e9462
Content-Type: text/plain; charset="UTF-8"

Thanks for reminding me.  :)

1/2 is queued but 2/2 was implicated in a number of systemd-related boot
failures on the autobuilder (
https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/553).

I've not yet got around to looking at exactly what sanity test 5 and 7 do
to trigger this.

Ross

On 8 November 2017 at 17:40, Martin Kelly <mkelly@xevo.com> wrote:

> (ping) for this patch series.
>
> On 10/16/2017 09:31 AM, Martin Kelly wrote:
>
>> The regex for acceptable systemd WantedBy/RequiredBy targets does not
>> include
>> target.wants, so a line like this:
>>
>> WantedBy=multi-user.target.wants
>>
>> gets silently ignored, even though it works fine on a real system.
>>
>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> ---
>>   meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl
>> b/meta/recipes-core/systemd/systemd-systemctl/systemctl
>> index efad14ce17..6e5a1b7181 100755
>> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
>> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
>> @@ -108,7 +108,7 @@ for service in $services; do
>>         # If any new unit types are added to systemd they should be added
>>         # to this regular expression.
>> -       unit_types_re='\.\(service\|socket\|device\|mount\|automoun
>> t\|swap\|target\|path\|timer\|snapshot\)\s*$'
>> +       unit_types_re='\.\(service\|socket\|device\|mount\|automoun
>> t\|swap\|target\|target\.wants\|path\|timer\|snapshot\)\s*$'
>>         if [ "$action" = "preset" ]; then
>>                 action=`egrep -sh  $service $ROOT/etc/systemd/user-preset/*.preset
>> | cut -f1 -d' '`
>>                 if [ -z "$action" ]; then
>>
>> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1143a75c6be296055d7e9462
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for reminding me. =C2=A0:)<div><br></div><div>1/2 i=
s queued but 2/2 was implicated in a number of systemd-related boot failure=
s on the autobuilder (<a href=3D"https://autobuilder.yocto.io/builders/nigh=
tly-qa-extras/builds/553">https://autobuilder.yocto.io/builders/nightly-qa-=
extras/builds/553</a>).</div><div><br></div><div>I&#39;ve not yet got aroun=
d to looking at exactly what sanity test 5 and 7 do to trigger this.</div><=
div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On 8 November 2017 at 17:40, Martin Kelly <span dir=3D"lt=
r">&lt;<a href=3D"mailto:mkelly@xevo.com" target=3D"_blank">mkelly@xevo.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">(ping) for this pa=
tch series.<span class=3D"im HOEnZb"><br>
<br>
On 10/16/2017 09:31 AM, Martin Kelly wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The regex for acceptable systemd WantedBy/RequiredBy targets does not inclu=
de<br>
target.wants, so a line like this:<br>
<br>
WantedBy=3Dmulti-user.target.wan<wbr>ts<br>
<br>
gets silently ignored, even though it works fine on a real system.<br>
<br>
Signed-off-by: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.com" target=
=3D"_blank">mkelly@xevo.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-core/systemd/syst<wbr>emd-systemctl/systemctl | 2 +-<br=
>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/sy<wbr>stemd-systemctl/systemctl b/m=
eta/recipes-core/systemd/sy<wbr>stemd-systemctl/systemctl<br>
index efad14ce17..6e5a1b7181 100755<br>
--- a/meta/recipes-core/systemd/sy<wbr>stemd-systemctl/systemctl<br>
+++ b/meta/recipes-core/systemd/sy<wbr>stemd-systemctl/systemctl<br>
@@ -108,7 +108,7 @@ for service in $services; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If any new unit types are added to systemd th=
ey should be added<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to this regular expression.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unit_types_re=3D&#39;\.\(service\|s<wbr>ocket\|=
device\|mount\|automoun<wbr>t\|swap\|target\|path\|timer\|<wbr>snapshot\)\s=
*$&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unit_types_re=3D&#39;\.\(service\|s<wbr>ocket\|=
device\|mount\|automoun<wbr>t\|swap\|target\|target\.<wbr>wants\|path\|time=
r\|snapshot\)<wbr>\s*$&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$action&quot; =3D &quot;preset&quot;=
 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D`egrep -sh=
=C2=A0 $service $ROOT/etc/systemd/user-preset/<wbr>*.preset | cut -f1 -d&#3=
9; &#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$acti=
on&quot; ]; then<br>
<br>
</blockquote>
-- <br></span><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1143a75c6be296055d7e9462--
