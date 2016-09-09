Return-Path: <pespin.shar@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 44B676FEF5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 17:49:00 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id u14so49429133lfd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Sep 2016 10:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+e6omt6nk36/Ir6u4cgcdTe2jlSubDUOUPuKgQXjfMc=;
	b=Zb+5rjsuGp+Ty8n/FUFpuFnw24mHe5542dFZANwqC/2oGUdClA3RrLinw+8zwjn6jg
	UpselOezW7/9wGzRAjn4qfkf5z9/jiW6zZQ5Wtsh9x0G4r45cd6HNiLGuHN7ZMzWlqzD
	zP73MrgdeUngwYOW1NcNkrp8HnJ5z/7LWxb72bCChgSgzM2hNJFvtKhmrwsBOJgbA66w
	jUp/NW8aqPaBTeHPut/oKyVPJCDZW76xm7Rh8ulnM7xdBUYLn1q5PL1MZDY2j3agba5O
	WneDW0aVFJIhqILU08JLN2hZ5QKDO1ERRkNLRhXyxE7Wczdzcf8pObE5iUBiSLNPmjhh
	oqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+e6omt6nk36/Ir6u4cgcdTe2jlSubDUOUPuKgQXjfMc=;
	b=WFzZnenv6dln3vuPZ73rz3h5C1z6XpBdInKBb/YyHTYhVOn6XB+PmVIpDAzBFg6Q9E
	h3epZ9ZpmiT+HPbCIlLtBqA7RXSAdvbiOTzXy/YXWEKFzSiEVkHUc4NcO0G3pwO3+r0H
	qR6uw7IhFW9gPqaY/aHjOmByIk9Icspkv0x20CtlMZ8N9DGOdXgD5SJazSxyW/FWKpeI
	azr/2bnn31o2TTPbutYbv04ftlky0IbisWhcdK/xNnA2mm5cTXGzT/I3rAfCNJbZSGZi
	NwoiG/dfRbfOda0Ag76t38SxiXFQ9+GEBscaKxzBToJeq9IsoZ+sVmI5qiDvVL+bHZxi
	aqVw==
X-Gm-Message-State: AE9vXwOhkbh/4ZDkWYJUeRS7ttHzrV8uqE7kcGvnFnoE/NFtDBJkUjC9oVvCaUSf12YMt8ekSr5jwkVzRPBFAw==
X-Received: by 10.25.74.138 with SMTP id x132mr1783555lfa.154.1473443340179;
	Fri, 09 Sep 2016 10:49:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.85.200 with HTTP; Fri, 9 Sep 2016 10:48:59 -0700 (PDT)
In-Reply-To: <57D0CDFE.7090101@windriver.com>
References: <cover.1473240119.git.Qi.Chen@windriver.com>
	<4e703d64c6d15986135603c94ad9730b7f6d66c7.1473240119.git.Qi.Chen@windriver.com>
	<CAEGpDuav43RX6WbQS5OVtDO6oRry-ybyMNt5iG8t1qMDriQ2gA@mail.gmail.com>
	<57D0CDFE.7090101@windriver.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
Date: Fri, 9 Sep 2016 19:48:59 +0200
Message-ID: <CAEGpDuaLXxOwHUByBOe8mZbt+LUqjtVs1Ak+o1TnSmb2gvXVLA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] systemd.bbclass: add support to manage user services
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
X-List-Received-Date: Fri, 09 Sep 2016 17:49:03 -0000
Content-Type: multipart/alternative; boundary=94eb2c1a1a64e3616d053c16c2f9

--94eb2c1a1a64e3616d053c16c2f9
Content-Type: text/plain; charset=UTF-8

Hi,

Pau Espin Pedrol

2016-09-08 4:33 GMT+02:00 ChenQi <Qi.Chen@windriver.com>:

> On 09/07/2016 08:14 PM, Pau Espin Pedrol wrote:
>
>
> 2016-09-07 11:22 GMT+02:00 Chen Qi <Qi.Chen@windriver.com>:
>
>> Add new variable SYSTEMD_USER_SERVICE and SYSTEM_USER_AUTO_ENABLE
>> to manage user services. Their usage is like SYSTEMD_SERVICE and
>> SYSTEMD_AUTO_ENABLE.
>>
>> [YOCTO #7800]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  meta/classes/systemd.bbclass | 17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
>> index db7873f..78cec97 100644
>> --- a/meta/classes/systemd.bbclass
>> +++ b/meta/classes/systemd.bbclass
>> @@ -7,6 +7,7 @@ SYSTEMD_PACKAGES_class-nativesdk ?= ""
>>
>>  # Whether to enable or disable the services on installation.
>>  SYSTEMD_AUTO_ENABLE ??= "enable"
>> +SYSTEMD_USER_AUTO_ENABLE ??= "enable"
>>
>>  # This class will be included in any recipe that supports systemd init
>> scripts,
>>  # even if systemd is not in DISTRO_FEATURES.  As such don't make any
>> changes
>> @@ -30,10 +31,14 @@ fi
>>
>>  if type systemctl >/dev/null 2>/dev/null; then
>>         systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>> +       systemctl $OPTS --global ${SYSTEMD_USER_AUTO_ENABLE}
>> ${SYSTEMD_USER_SERVICE}
>>
>
> I'm not sure having these 2 systemctl being executed together everytime is
> a good idea. What if a recipe has a user service and no system service?
>
>
> Hi Pau Espin Pedrol,
>
> Thanks for your review.
>
> The postinstall script runs successfully with expected result at rootfs
> time. But your question reminds me of the situation of the on-target
> install/remove situation. I think I'll need to make a new patch to make
> sure things work in both situations.
>
> The key point here is that 'systemctl' at rootfs time is a shell script
> written by ourselves and 'systemctl' on target is that provided by systemd.
>

Yes, I was unaware of the existance of that OE script when I worked on
this. Why are we using that script at build time instead of using systemd's
systemctl? Any good reason for that? git log only shows it was imported
from another repo a while ago.


>
> We are calling the first one with an empty system service? Or we are may
> be enabling a systemd system service which should not be enabled according
> to the recipe? I have the feeling this kind of cases are not being catch in
> here and other pkg scripts in this commit.
>
> It is far from perfect, but in case you didn't, you may want to have a
> look at my initial/previous commit to try to fix the issue:
> https://www.mail-archive.com/openembedded-devel@lists.
> openembedded.org/msg42187.html
>
>
>>
>>         if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
>>                 systemctl restart ${SYSTEMD_SERVICE}
>>         fi
>> +       if [ -z "$D" -a "${SYSTEMD_USER_AUTO_ENABLE}" = "enable" ]; then
>> +               systemctl --global restart ${SYSTEMD_USER_SERVICE}
>> +       fi
>>  fi
>>  }
>>
>> @@ -47,9 +52,11 @@ fi
>>  if type systemctl >/dev/null 2>/dev/null; then
>>         if [ -z "$D" ]; then
>>                 systemctl stop ${SYSTEMD_SERVICE}
>> +               systemctl --global stop ${SYSTEMD_USER_SERVICE}
>>
>
> I think this is not gonna work, you cannot call --global with stop afair.
> I'm not sure which is the good solution for this though, but you should
> ideally go through all systemd user sessions and call "systemctl --user
> stop". No idea if that's actually easily feasible.
>
>
> The service is enabled and started with '--global' option, and stopping it
> with '--global' option seems reasonable to me. If there's some special
> case, let's look into it then.
>
>

Did you try running it in a running image? As in taking the ipkg, and
reinstalling it live in the image with systemd's systemctl. I bet you will
get an error from systemctl for both "--gobal restart" and "--global stop".
At least it used to be like that afair.



> Best Regards,
> Chen Qi
>
>
>
>
>>         fi
>>
>>         systemctl $OPTS disable ${SYSTEMD_SERVICE}
>> +       systemctl $OPTS --global disable ${SYSTEMD_USER_SERVICE}
>>  fi
>>  }
>>
>> @@ -139,12 +146,14 @@ python systemd_populate_packages() {
>>      def systemd_check_services():
>>          searchpaths = [oe.path.join(d.getVar("sysconfdir", True),
>> "systemd", "system"),]
>>          searchpaths.append(d.getVar("systemd_system_unitdir", True))
>> +        searchpaths.append(oe.path.join(d.getVar("sysconfdir", True),
>> "systemd", "user"))
>> +        searchpaths.append(d.getVar("systemd_user_unitdir", True))
>>          systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
>>
>>          keys = 'Also'
>>          # scan for all in SYSTEMD_SERVICE[]
>>          for pkg_systemd in systemd_packages.split():
>> -            for service in get_package_var(d, 'SYSTEMD_SERVICE',
>> pkg_systemd).split():
>> +            for service in (get_package_var(d, 'SYSTEMD_SERVICE',
>> pkg_systemd) + get_package_var(d, 'SYSTEMD_USER_SERVICE',
>> pkg_systemd)).split():
>>                  path_found = ''
>>
>>                  # Deal with adding, for example, 'ifplugd@eth0.service'
>> from
>> @@ -165,14 +174,14 @@ python systemd_populate_packages() {
>>                  if path_found != '':
>>                      systemd_add_files_and_parse(pkg_systemd,
>> path_found, service, keys)
>>                  else:
>> -                    raise bb.build.FuncFailed("SYSTEMD_SERVICE_%s value
>> %s does not exist" % \
>> -                        (pkg_systemd, service))
>> +                    raise bb.build.FuncFailed("SYSTEMD_SERVICE_%s or
>> SYSTEMD_USER_SERVICE_%s value %s does not exist" % \
>> +                        (pkg_systemd, pkg_systemd, service))
>>
>>      # Run all modifications once when creating package
>>      if os.path.exists(d.getVar("D", True)):
>>          for pkg in d.getVar('SYSTEMD_PACKAGES', True).split():
>>              systemd_check_package(pkg)
>> -            if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
>> +            if d.getVar('SYSTEMD_SERVICE_' + pkg, True) or
>> d.getVar('SYSTEMD_USER_SERVICE_' + pkg, True):
>>                  systemd_generate_package_scripts(pkg)
>>          systemd_check_services()
>>  }
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>

--94eb2c1a1a64e3616d053c16c2f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div class=3D"gmail_extra"><br clear=3D"all"><div><=
div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div>Pau Espin Pedrol<br></div></div></div></div>
<br><div class=3D"gmail_quote">2016-09-08 4:33 GMT+02:00 ChenQi <span dir=
=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.=
Chen@windriver.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><div><div class=3D"h5">
    <div>On 09/07/2016 08:14 PM, Pau Espin
      Pedrol wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">2016-09-07 11:22 GMT+02:00 Chen Qi <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blan=
k">Qi.Chen@windriver.com</a>&gt;</span>:<br>
            <blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote">Add new varia=
ble SYSTEMD_USER_SERVICE
              and SYSTEM_USER_AUTO_ENABLE<br>
              to manage user services. Their usage is like
              SYSTEMD_SERVICE and<br>
              SYSTEMD_AUTO_ENABLE.<br>
              <br>
              [YOCTO #7800]<br>
              <br>
              Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windrive=
r.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
              ---<br>
              =C2=A0meta/classes/systemd.bbclass | 17 +++++++++++++----<br>
              =C2=A01 file changed, 13 insertions(+), 4 deletions(-)<br>
              <br>
              diff --git a/meta/classes/systemd.bbclass
              b/meta/classes/systemd.bbclass<br>
              index db7873f..78cec97 100644<br>
              --- a/meta/classes/systemd.bbclass<br>
              +++ b/meta/classes/systemd.bbclass<br>
              @@ -7,6 +7,7 @@ SYSTEMD_PACKAGES_class-natives<wbr>dk ?=3D
              &quot;&quot;<br>
              <br>
              =C2=A0# Whether to enable or disable the services on
              installation.<br>
              =C2=A0SYSTEMD_AUTO_ENABLE ??=3D &quot;enable&quot;<br>
              +SYSTEMD_USER_AUTO_ENABLE ??=3D &quot;enable&quot;<br>
              <br>
              =C2=A0# This class will be included in any recipe that suppor=
ts
              systemd init scripts,<br>
              =C2=A0# even if systemd is not in DISTRO_FEATURES.=C2=A0 As s=
uch
              don&#39;t make any changes<br>
              @@ -30,10 +31,14 @@ fi<br>
              <br>
              =C2=A0if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br=
>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 systemctl $OPTS ${SYSTEMD_AUTO_EN=
ABLE}
              ${SYSTEMD_SERVICE}<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl $OPTS --global
              ${SYSTEMD_USER_AUTO_ENABLE} ${SYSTEMD_USER_SERVICE}=C2=A0<br>
            </blockquote>
            <div><br>
            </div>
            <div>I&#39;m not sure having these 2 systemctl being executed
              together everytime is a good idea. What if a recipe has a
              user service and no system service?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></div></div>
    Hi Pau Espin Pedrol,<br>
    <br>
    Thanks for your review.<br>
    <br>
    The postinstall script runs successfully with expected result at
    rootfs time. But your question reminds me of the situation of the
    on-target install/remove situation. I think I&#39;ll need to make a new
    patch to make sure things work in both situations.<br>
    <br>
    The key point here is that &#39;systemctl&#39; at rootfs time is a shel=
l
    script written by ourselves and &#39;systemctl&#39; on target is that
    provided by systemd.<span class=3D""><br></span></div></blockquote><div=
><br></div><div>Yes, I was unaware of the existance of that OE script when =
I worked on this. Why are we using that script at build time instead of usi=
ng systemd&#39;s systemctl? Any good reason for that? git log only shows it=
 was imported from another repo a while ago.<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=3D"#000000"><span =
class=3D"">
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div> We are calling the first one with an empty system
              service? Or we are may be enabling a systemd system
              service which should not be enabled according to the
              recipe? I have the feeling this kind of cases are not
              being catch in here and other pkg scripts in this commit.<br>
              <br>
            </div>
            <div>It is far from perfect, but in case you didn&#39;t, you ma=
y
              want to have a look at my initial/previous commit to try
              to fix the issue: <a href=3D"https://www.mail-archive.com/ope=
nembedded-devel@lists.openembedded.org/msg42187.html" target=3D"_blank">htt=
ps://www.mail-archive.com/<wbr>openembedded-devel@lists.<wbr>openembedded.o=
rg/msg42187.html</a><br>
            </div>
            <div>=C2=A0</div>
            <blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote">
              <br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$D&quot; -a &quot;$=
{SYSTEMD_AUTO_ENABLE}&quot; =3D
              &quot;enable&quot; ]; then<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syste=
mctl restart ${SYSTEMD_SERVICE}<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$D&quot; -a &quot;$=
{SYSTEMD_USER_AUTO_ENABLE}&quot; =3D
              &quot;enable&quot; ]; then<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0syste=
mctl --global restart
              ${SYSTEMD_USER_SERVICE}<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
              =C2=A0fi<br>
              =C2=A0}<br>
              <br>
              @@ -47,9 +52,11 @@ fi<br>
              =C2=A0if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br=
>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$D&quot; ]; then<br=
>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syste=
mctl stop ${SYSTEMD_SERVICE}<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0syste=
mctl --global stop
              ${SYSTEMD_USER_SERVICE}<br>
            </blockquote>
            <div><br>
            </div>
            <div>I think this is not gonna work, you cannot call
              --global with stop afair. I&#39;m not sure which is the good
              solution for this though, but you should ideally go
              through all systemd user sessions and call &quot;systemctl
              --user stop&quot;. No idea if that&#39;s actually easily feas=
ible.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></span>
    The service is enabled and started with &#39;--global&#39; option, and
    stopping it with &#39;--global&#39; option seems reasonable to me. If
    there&#39;s some special case, let&#39;s look into it then.<br>
    <br></div></blockquote><div><br><br></div><div>Did you try running it i=
n a running image? As in taking the ipkg, and reinstalling it live in the i=
mage with systemd&#39;s systemctl. I bet you will get an error from systemc=
tl for both &quot;--gobal restart&quot; and &quot;--global stop&quot;. At l=
east it used to be like that afair.<br></div><div><br>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=3D"#000000">
    Best Regards,<br>
    Chen Qi<div><div class=3D"h5"><br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>=C2=A0</div>
            <blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote">
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
              <br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 systemctl $OPTS disable ${SYSTEMD=
_SERVICE}<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl $OPTS --global disable
              ${SYSTEMD_USER_SERVICE}<br>
              =C2=A0fi<br>
              =C2=A0}<br>
              <br>
              @@ -139,12 +146,14 @@ python systemd_populate_packages() {<br=
>
              =C2=A0 =C2=A0 =C2=A0def systemd_check_services():<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0searchpaths =3D [oe.path.jo=
in(d.getVar(&quot;syscon<wbr>fdir&quot;,
              True), &quot;systemd&quot;, &quot;system&quot;),]<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0searchpaths.append(d.getVar=
(&quot;<wbr>systemd_system_unitdir&quot;,
              True))<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 searchpaths.append(oe.path.joi<w=
br>n(d.getVar(&quot;sysconfdir&quot;,
              True), &quot;systemd&quot;, &quot;user&quot;))<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 searchpaths.append(d.getVar(&quo=
t;s<wbr>ystemd_user_unitdir&quot;,
              True))<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_packages =3D d.getV=
ar(&#39;SYSTEMD_PACKAGES&#39;,
              True)<br>
              <br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0keys =3D &#39;Also&#39;<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# scan for all in SYSTEMD_S=
ERVICE[]<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for pkg_systemd in systemd_=
packages.split():<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for service in get=
_package_var(d,
              &#39;SYSTEMD_SERVICE&#39;, pkg_systemd).split():<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for service in (ge=
t_package_var(d,
              &#39;SYSTEMD_SERVICE&#39;, pkg_systemd) + get_package_var(d,
              &#39;SYSTEMD_USER_SERVICE&#39;, pkg_systemd)).split():<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0path_found =3D &#39;&#39;<br>
              <br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# Deal with adding, for example,
              &#39;<a href=3D"mailto:ifplugd@eth0.service" target=3D"_blank=
">ifplugd@eth0.service</a>&#39; from<br>
              @@ -165,14 +174,14 @@ python systemd_populate_packages() {<br=
>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if path_found !=3D &#39;&#39;:<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0systemd_add_files_and_parse(p<wbr>kg_systemd,
              path_found, service, keys)<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else:<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 raise bb.build.FuncFailed(&quot;SYSTEMD_S<wbr>ERVICE_%s
              value %s does not exist&quot; % \<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (pkg_systemd, service))<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 raise bb.build.FuncFailed(&quot;SYSTEMD_S<wbr>ERVICE_%s
              or SYSTEMD_USER_SERVICE_%s value %s does not exist&quot; % \<=
br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (pkg_systemd, pkg_systemd,
              service))<br>
              <br>
              =C2=A0 =C2=A0 =C2=A0# Run all modifications once when creatin=
g package<br>
              =C2=A0 =C2=A0 =C2=A0if os.path.exists(d.getVar(&quot;D&quot;,=
 True)):<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for pkg in d.getVar(&#39;SY=
STEMD_PACKAGES&#39;,
              True).split():<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_check=
_package(pkg)<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&#39;S=
YSTEMD_SERVICE_&#39; + pkg, True):<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&#39;S=
YSTEMD_SERVICE_&#39; + pkg, True)
              or d.getVar(&#39;SYSTEMD_USER_SERVICE<wbr>_&#39; + pkg, True)=
:<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0systemd_generate_package_scri<wbr>pts(pkg)<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_check_services()<br=
>
              =C2=A0}<br>
              <span><font color=3D"#888888">--<br>
                  1.9.1<br>
                  <br>
                  --<br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a href=3D"mailto:Openembedded-core@lists.openembedded.or=
g" target=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                  <a rel=3D"noreferrer" href=3D"http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core" target=3D"_blank">http://lists.opene=
mbedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </font></span></blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div></div>

--94eb2c1a1a64e3616d053c16c2f9--
