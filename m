Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.11071.1593505466233830770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 01:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H9SjJS+K;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id q15so5998927uap.4
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DfAXBYAjzygm4nuRf7dGCGlwArXkdb4W6mwkoQeqrRc=;
        b=H9SjJS+Ky0IgE/6jZ263gNsGTuWyjRHIIsTP/jaHySVpUYuVswiaAUUBSgXFkBlHUW
         MsgfPGvVUk3G+uxr5YrGiKKT1f6DrANHHfmK4VXVKjNuA651Pp+pkiategfD5rBvfC+b
         dOcm3HM9Wis/rsBIoYOcGPLD7hMsZWLQlZTiBXDBA0u/6MP+mhiTm4UoM4AhuCeKXE1s
         WGabVeXBcKlv/VOw3J4aYdEXxZbRgIK2CKADJ0DFC7O++LJQOWSSE1kTKO4Wak3jbUc3
         HtDIwG2F05nuz0vF2OJyOxk9IMkVGBUuf7/AOSWyfQGlAiTEHK3dU1KsVwfD3gU9Jl0G
         LzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DfAXBYAjzygm4nuRf7dGCGlwArXkdb4W6mwkoQeqrRc=;
        b=of/HH/1VNcldZJCWfnCYIWinVOPwDSaNqIBaIEkfJSfKMcZmaFcc/IsIf5/F3yih25
         h4NGg6mnZWcYpLu6goUs1CkHiVAla24Q489QXAuxzBp5Nf+5rBFoGVuKFQ55syPAYFRY
         FHi/W6WwAqFgvwFqitwJZ5PdmQ01JcGSYqRyHkkKUXIKYQsA7N2lmCBpDWyDf5W5PVR6
         uA+V8B3SMR/jyzUxW7g0NuiknRqqxoTQt+QGZvuyQY0sbPgpJzgMhFKxuHXjgFtUCNCP
         EJ+/2wtwqMC4B8KxA/IAdG+N4Q4cPSBzACpWXsCdexuJM23yIlaMtfRHLMYg6vmqk4La
         C1tw==
X-Gm-Message-State: AOAM533YhDh92UzlOHPPNPOB2GfRi5GMxv/TcZJ8DrRpVLZgOVfkaq1E
	ykiFX8KeM7bXqMXVyM0rtyk0AUojosrjAhaUAjqw2ewj
X-Google-Smtp-Source: ABdhPJy+c4+AqHaqs9V4++LvD2oZnkMhq2mLhlmfYByfc5Xvg1hk2R4exFS50iUPhO+qq2Vu4WKfFPFWGHvavrvnQME=
X-Received: by 2002:ab0:2a1:: with SMTP id 30mr12946819uah.93.1593505465313;
 Tue, 30 Jun 2020 01:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <e5Dw.1593365236614554114.mV8j@lists.openembedded.org>
 <CANNYZj8ondQew3MqtyLr1k-EyBLG52KfT_wu3mRabZRpjecQEg@mail.gmail.com> <f0fc34bfb15642bdab4a1def06639238@multitech.com>
In-Reply-To: <f0fc34bfb15642bdab4a1def06639238@multitech.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 30 Jun 2020 10:24:14 +0200
Message-ID: <CANNYZj_L2fE=j2o7pZ+_i_UH8GgVEZQR3kmg=obJi5vxjWnKqA@mail.gmail.com>
Subject: Re: [OE-core] git do_unpack
To: John Klug <John.Klug@multitech.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000352fd605a948e78c"

--000000000000352fd605a948e78c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This happens if the recipe does not specify the exact revision hash to use
in SRCREV.  If it says "use latest revision" or "use this tag", then
bitbake will do ls-remote on the original repo to resolve those to
up-to-date revisions, which is not unreasonable.

What does the recipe look like?

Alex

On Tue, 30 Jun 2020 at 06:45, John Klug <John.Klug@multitech.com> wrote:

>
> a:
>
> (fetch was already run successfully while connected with a VPN).
>
> VPN then shut down.
>
>   $  bitbake -c unpack dhq-client
>
>      ...
>   NOTE: Executing RunQueue Tasks
>   ERROR: dhq-client-0.32-r11 do_unpack: Fetcher failure: Fetch command
> export  DBUS_SESSION_BUS_ADDRESS=3D"unix:abstract=3D/tmp/dbus-CbyhEfsmW1"=
;
> export SSH_AGENT_PID=3D"2444"; export
> SSH_AUTH_SOCK=3D"/tmp/ssh-gHgQLFqq7E5R/agent.2443"; export
> PATH=3D"/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/usr/bin=
/python-native:/home/klugja/mlinux-up-14/layers/openembedded-core/scripts:/=
home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/usr/bin/arm-mlinux=
-linux-gnueabi:/home/klugja/mlinux-up-14/build/tmp/sysroots/mt100eocg/usr/b=
in/crossscripts:/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/u=
sr/sbin:/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/usr/bin:/=
home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/sbin:/home/klugja/=
mlinux-up-14/build/tmp/sysroots/x86_64-linux/bin:/home/klugja/mlinux-up-14/=
scripts:/home/klugja/mlinux-up-14/bitbake/bin:/home/klugja/bin:/home/klugja=
/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/game=
s:/usr/local/games:/snap/bin";
> export HOME=3D"/home/klugja"; git -c core.fsyncobjectfiles=3D0 ls-remote =
ssh://
> git@gitlab.multitech.net/devicehq/mAPI-dhq-client.git  failed with exit
> code 128, output:
>   ssh: connect to host gitlab.multitech.net port 22: Connection timed out
>   fatal: Could not read from remote repository.
>
>   Please make sure you have the correct access rights
>   and the repository exists.
>
>   ERROR: dhq-client-0.32-r11 do_unpack: Function failed: base_do_unpack
>   ERROR: Logfile of failure stored in:
> /home/klugja/mlinux-up-14/build/tmp/work/mt100eocg-mlinux-linux-gnueabi/d=
hq-client/0.32-r11/temp/log.do_unpack.10175
>   ERROR: Task
> (/home/klugja/mlinux-up-14/build/../layers/meta-mlinux/recipes-core/dhq-c=
lient/dhq-client_0.32.bb:do_unpack)
> failed with exit code '1'
>   NOTE: Tasks Summary: Attempted 2 tasks of which 1 didn't need to be
> rerun and 1 failed.
>
>   Summary: 1 task failed:
>
> /home/klugja/mlinux-up-14/build/../layers/meta-mlinux/recipes-core/dhq-cl=
ient/dhq-client_0.32.bb:
> do_unpack
>   Summary: There was 1 WARNING message shown.
>   Summary: There were 2 ERROR messages shown, returning a non-zero exit
> code.
>
>
> Line 3 of the do_unpack.log:
>
>   DEBUG: Fetcher accessed the network with the command git -c
> core.fsyncobjectfiles=3D0 ls-remote ssh://
> git@gitlab.multitech.net/devicehq/mAPI-dhq-client.git
>
> Testing the download of the git (download is verifiable):
>   klugja@peru:~/mlinux-up-14/build/downloads/git2/gitlab.multitech.net.de=
vicehq.mAPI-dhq-client.git$
> git fsck
>   Checking object directories: 100% (256/256), done.
>   Checking objects: 100% (485/485), done.
>   klugja@peru
> :~/mlinux-up-14/build/downloads/git2/gitlab.multitech.net.devicehq.mAPI-d=
hq-client.git$
>
>
>
> b.  Too busy writing my own git commands in my own do_unpack to fix this.
> Maybe someday.
>

--000000000000352fd605a948e78c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This happens if the recipe does not specify the exact=
 revision hash to use in SRCREV.=C2=A0 If it says &quot;use latest revision=
&quot; or &quot;use this tag&quot;, then bitbake will do ls-remote on the o=
riginal repo to resolve those to up-to-date revisions, which is not unreaso=
nable.<br></div><div><br></div><div>What does the recipe look like?</div><d=
iv><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, 30 Jun 2020 at 06:45, John Klug &lt=
;<a href=3D"mailto:John.Klug@multitech.com">John.Klug@multitech.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
a:<br>
<br>
(fetch was already run successfully while connected with a VPN).<br>
<br>
VPN then shut down.<br>
<br>
=C2=A0 $=C2=A0 bitbake -c unpack dhq-client<br>
<br>
=C2=A0 =C2=A0 =C2=A0...<br>
=C2=A0 NOTE: Executing RunQueue Tasks<br>
=C2=A0 ERROR: dhq-client-0.32-r11 do_unpack: Fetcher failure: Fetch command=
 export=C2=A0 DBUS_SESSION_BUS_ADDRESS=3D&quot;unix:abstract=3D/tmp/dbus-Cb=
yhEfsmW1&quot;; export SSH_AGENT_PID=3D&quot;2444&quot;; export SSH_AUTH_SO=
CK=3D&quot;/tmp/ssh-gHgQLFqq7E5R/agent.2443&quot;; export PATH=3D&quot;/hom=
e/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/usr/bin/python-native=
:/home/klugja/mlinux-up-14/layers/openembedded-core/scripts:/home/klugja/ml=
inux-up-14/build/tmp/sysroots/x86_64-linux/usr/bin/arm-mlinux-linux-gnueabi=
:/home/klugja/mlinux-up-14/build/tmp/sysroots/mt100eocg/usr/bin/crossscript=
s:/home/klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/usr/sbin:/home/=
klugja/mlinux-up-14/build/tmp/sysroots/x86_64-linux/usr/bin:/home/klugja/ml=
inux-up-14/build/tmp/sysroots/x86_64-linux/sbin:/home/klugja/mlinux-up-14/b=
uild/tmp/sysroots/x86_64-linux/bin:/home/klugja/mlinux-up-14/scripts:/home/=
klugja/mlinux-up-14/bitbake/bin:/home/klugja/bin:/home/klugja/bin:/usr/loca=
l/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/g=
ames:/snap/bin&quot;; export HOME=3D&quot;/home/klugja&quot;; git -c core.f=
syncobjectfiles=3D0 ls-remote ssh://<a href=3D"http://git@gitlab.multitech.=
net/devicehq/mAPI-dhq-client.git" rel=3D"noreferrer" target=3D"_blank">git@=
gitlab.multitech.net/devicehq/mAPI-dhq-client.git</a>=C2=A0 failed with exi=
t code 128, output:<br>
=C2=A0 ssh: connect to host <a href=3D"http://gitlab.multitech.net" rel=3D"=
noreferrer" target=3D"_blank">gitlab.multitech.net</a> port 22: Connection =
timed out<br>
=C2=A0 fatal: Could not read from remote repository.<br>
<br>
=C2=A0 Please make sure you have the correct access rights<br>
=C2=A0 and the repository exists.<br>
<br>
=C2=A0 ERROR: dhq-client-0.32-r11 do_unpack: Function failed: base_do_unpac=
k<br>
=C2=A0 ERROR: Logfile of failure stored in: /home/klugja/mlinux-up-14/build=
/tmp/work/mt100eocg-mlinux-linux-gnueabi/dhq-client/0.32-r11/temp/log.do_un=
pack.10175<br>
=C2=A0 ERROR: Task (/home/klugja/mlinux-up-14/build/../layers/meta-mlinux/r=
ecipes-core/dhq-client/dhq-client_0.32.bb:do_unpack) failed with exit code =
&#39;1&#39;<br>
=C2=A0 NOTE: Tasks Summary: Attempted 2 tasks of which 1 didn&#39;t need to=
 be rerun and 1 failed.<br>
<br>
=C2=A0 Summary: 1 task failed:<br>
=C2=A0 =C2=A0 /home/klugja/mlinux-up-14/build/../layers/meta-mlinux/recipes=
-core/dhq-client/dhq-client_0.32.bb:do_unpack<br>
=C2=A0 Summary: There was 1 WARNING message shown.<br>
=C2=A0 Summary: There were 2 ERROR messages shown, returning a non-zero exi=
t code.<br>
<br>
<br>
Line 3 of the do_unpack.log:<br>
<br>
=C2=A0 DEBUG: Fetcher accessed the network with the command git -c core.fsy=
ncobjectfiles=3D0 ls-remote ssh://<a href=3D"http://git@gitlab.multitech.ne=
t/devicehq/mAPI-dhq-client.git" rel=3D"noreferrer" target=3D"_blank">git@gi=
tlab.multitech.net/devicehq/mAPI-dhq-client.git</a><br>
<br>
Testing the download of the git (download is verifiable):<br>
=C2=A0 klugja@peru:~/mlinux-up-14/build/downloads/git2/gitlab.multitech.net=
.devicehq.mAPI-dhq-client.git$ git fsck<br>
=C2=A0 Checking object directories: 100% (256/256), done.<br>
=C2=A0 Checking objects: 100% (485/485), done.<br>
=C2=A0 klugja@peru:~/mlinux-up-14/build/downloads/git2/gitlab.multitech.net=
.devicehq.mAPI-dhq-client.git$<br>
<br>
<br>
<br>
b.=C2=A0 Too busy writing my own git commands in my own do_unpack to fix th=
is.=C2=A0 Maybe someday.<br>
</blockquote></div>

--000000000000352fd605a948e78c--
