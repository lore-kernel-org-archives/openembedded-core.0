Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id A41137F311
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:51:11 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p15so81244923eds.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 23:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=82IzPfilDrzWuTur8VS7VVWfDMToiOYdtI3QSjpCslQ=;
	b=oOKpEDLckZVR9DYuYkvjEM9xOTC0BKtxvJ3iINR17+nS3lR6Q5Ln+40AlMrvvm4Se9
	LEMhbizErL2YxBBvt7guajuGShG8v7xIWvsTGhFLzAnqULTWzPuOGspQ44strjrHCNWW
	JdvGDLjdejAKKls3Lq3f46Bk5TwPMFOa2xgQskT9e3dC9zYfk1u2P0aeuMPsxsu1h2+f
	6vFXSm+ahLwjuUjOd/BYLjMZEBpTmOjtfOVK8Q+GeUDz9X3Nti/jrMkETHDnQrJfJf9x
	89XNadjHznMuhQTskWrdSJowpHrHHIF/GMuW7pY30vLAoSUCbaF0ppQkYOzfqC3JV78q
	U+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=82IzPfilDrzWuTur8VS7VVWfDMToiOYdtI3QSjpCslQ=;
	b=ubPpy+M/MAnrWAKFHgyPxiWB5ftVVGa3nT8GHSB093x33Nroj80UBNWbhX6rIjEoqi
	1eKcDsohKH0eu33phFx1YKhNgpJ2Cg07ENvilSG5LC3Ac6JAJ8oGuBNRuoEZGPrdI0kY
	raj89Ww88UEKQ/3D5ObmFv2Rbru76x/jzwFKsQ/ZtYaRPYzcVQ2Ys02CQidOJnRMZGmJ
	QLOsWKfQpjIbLeGpnHwGhnlNrb3dotI6NTDkpolJB8u23ysFokHYZ7Gh4og8aCjvWZdC
	FQwKvpSLKhvJ3dTTHN2DeYcQJI9MPx7NfFD0uNSvRmclBbiH9/26KkdXqvm9bYCnRm3O
	5HRA==
X-Gm-Message-State: APjAAAXX5IDmxzvI8uU+CEeBKI0yB9au9VOuzt/BTKg+TJbu6e1zd4gZ
	0HVw775ao+MNObOBCzk9XnCuJryiWUPAq4qtZoa6puEBXZM=
X-Google-Smtp-Source: APXvYqxwfstg3aqHDtYy+Waj53UVVybPgUH5CzCDjbb9NduSebfBoajoWd2sEwHnbvO/EzD0QUDH9UTYWF6Es2Vpv0Q=
X-Received: by 2002:a17:906:6a87:: with SMTP id
	p7mr1653312ejr.277.1565074272243; 
	Mon, 05 Aug 2019 23:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190801200354.119252-1-jason.wessel@windriver.com>
	<8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
	<20190801185725.139cfa73@seebsdell>
	<f991e41b-39c6-a088-63aa-07553cae131b@windriver.com>
	<20190802120733.4a24ca3f@seebsdell>
	<20190802124246.27d4beca@seebsdell>
	<CAMKF1sr-gxJBXUn6OtU=0GtTw=CTLWfFLVWjATB-_k-1NYCP1g@mail.gmail.com>
	<20190803092307.486e930d@seebsdell>
	<6E51916E4A1F32428260031F4C7CD2B64ED7F64C@ORSMSX116.amr.corp.intel.com>
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B64ED7F64C@ORSMSX116.amr.corp.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 Aug 2019 08:51:01 +0200
Message-ID: <CA+chaQcc2996g2xKdzJpaKJN4f4=3t6gHVvA5JREn3yHYLvKHg@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
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
X-List-Received-Date: Tue, 06 Aug 2019 06:51:11 -0000
Content-Type: multipart/alternative; boundary="0000000000000b550c058f6d402a"

--0000000000000b550c058f6d402a
Content-Type: text/plain; charset="UTF-8"

This is the same reproducer I am using in:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12434
but with this SRCREV I haven't reproduced it yet in first 500 iterations,
so it's definitely improving for me (used to reproduce it at least once in
first 500 iterations)

Now I'm testing the reproducer with "qmake -install qinstall".

Regards,

On Tue, Aug 6, 2019 at 12:43 AM Bystricky, Juro <juro.bystricky@intel.com>
wrote:

> I can reproduce the problem fairly easily  (and, sadly even with the
> latest commits as 060058bb29f70b244e685b3c704eb0641b736f73 ).
> In my case, it seems easy to reproduce if I have 40+ threads running.
> The reproducer script (below) fails typically within the first 10
> iterations.
>
>
> #!/bin/bash
>
> fname='glibc-locale_master_august8'
> max=1000
> for (( i=1; i <= $max; i++ ))
> do
>     echo "$i/$max  ${fname}_$i.log"
>     bitbake glibc-locale -c cleanall 2>&1 > /dev/null
>     bitbake glibc-locale 2>&1 > ${fname}_$i.log
>      if grep -q "host-user-contaminated" ${fname}_$i.log; then
>         echo "error !"
>       exit 2
>     #else
>       #rm ${fname}_$i.log
>     fi
>
> done
>
> ________________________________________
> From: openembedded-core-bounces@lists.openembedded.org [
> openembedded-core-bounces@lists.openembedded.org] on behalf of Seebs [
> seebs@seebs.net]
> Sent: Saturday, August 03, 2019 7:23 AM
> To: Khem Raj
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH v2] pseudo: Upgrade to latest to fix
> openat() with a directory symlink [NAK]
>
> On Sat, 3 Aug 2019 05:33:46 -0700
> Khem Raj <raj.khem@gmail.com> wrote:
>
> > Will this fix the file ownership issue that we see with Glibc-locale
> > packages from time to time?
>
> I have no idea. Since I haven't got a reliable reproducer for it, I
> can't test it in a sane way.
>
> -s
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000000b550c058f6d402a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is the same reproducer I am using in:<div><a href=3D"=
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12434">https://bugzilla=
.yoctoproject.org/show_bug.cgi?id=3D12434</a><br></div><div>but with this S=
RCREV I haven&#39;t reproduced it yet in first 500 iterations, so it&#39;s =
definitely improving for me (used to reproduce it at least once in first 50=
0 iterations)</div><div><br></div><div>Now I&#39;m testing the reproducer w=
ith &quot;qmake -install qinstall&quot;.</div><div><br></div><div>Regards,<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Aug 6, 2019 at 12:43 AM Bystricky, Juro &lt;<a href=3D"mailto:=
juro.bystricky@intel.com">juro.bystricky@intel.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">I can reproduce the probl=
em fairly easily=C2=A0 (and, sadly even with the latest commits as 060058bb=
29f70b244e685b3c704eb0641b736f73 ). <br>
In my case, it seems easy to reproduce if I have 40+ threads running.<br>
The reproducer script (below) fails typically within the first 10 iteration=
s.<br>
<br>
<br>
#!/bin/bash<br>
<br>
fname=3D&#39;glibc-locale_master_august8&#39;<br>
max=3D1000<br>
for (( i=3D1; i &lt;=3D $max; i++ ))<br>
do<br>
=C2=A0 =C2=A0 echo &quot;$i/$max=C2=A0 ${fname}_$i.log&quot;<br>
=C2=A0 =C2=A0 bitbake glibc-locale -c cleanall 2&gt;&amp;1 &gt; /dev/null<b=
r>
=C2=A0 =C2=A0 bitbake glibc-locale 2&gt;&amp;1 &gt; ${fname}_$i.log<br>
=C2=A0 =C2=A0 =C2=A0if grep -q &quot;host-user-contaminated&quot; ${fname}_=
$i.log; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;error !&quot;<br>
=C2=A0 =C2=A0 =C2=A0 exit 2<br>
=C2=A0 =C2=A0 #else<br>
=C2=A0 =C2=A0 =C2=A0 #rm ${fname}_$i.log<br>
=C2=A0 =C2=A0 fi<br>
<br>
done<br>
<br>
________________________________________<br>
From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core-bounces@lists.openembedded.org</a> [<a h=
ref=3D"mailto:openembedded-core-bounces@lists.openembedded.org" target=3D"_=
blank">openembedded-core-bounces@lists.openembedded.org</a>] on behalf of S=
eebs [<a href=3D"mailto:seebs@seebs.net" target=3D"_blank">seebs@seebs.net<=
/a>]<br>
Sent: Saturday, August 03, 2019 7:23 AM<br>
To: Khem Raj<br>
Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_=
blank">openembedded-core@lists.openembedded.org</a><br>
Subject: Re: [OE-core] [PATCH v2] pseudo: Upgrade to latest to fix openat()=
 with a directory symlink [NAK]<br>
<br>
On Sat, 3 Aug 2019 05:33:46 -0700<br>
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Will this fix the file ownership issue that we see with Glibc-locale<b=
r>
&gt; packages from time to time?<br>
<br>
I have no idea. Since I haven&#39;t got a reliable reproducer for it, I<br>
can&#39;t test it in a sane way.<br>
<br>
-s<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000000b550c058f6d402a--
