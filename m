Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2567961F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 21:24:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b19-v6so2777253wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 14:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0xHmROc4l9w7Bn8Ja9lYoS6he35UNcmBfNwZsCn4CUA=;
	b=EBjIEAugXPWuIgHY/Z/EIXLfUdgM0/zJ+eKJax8nAelEZrzfB8GDpc5rdoZbmepTI3
	+BiwpeyfJdGRp17NWF2QmxhLH86pxBslqni15W1XxcgQSZIr03S5s3JtO8yxN8BJbnZs
	2V1RugpH3JsegnRq1TpT3QEYYNkOydlaO8eXvjUun/DmqCoNB5BeiMYAgsOwFfq1II1D
	SNJRbi5tU1qWh8B7wAdr5zVaI9v6Ly+6EM3ON2wg9NBOuolRIdSD+SWecIURURfWKxaU
	eApV46m7BERIvZvs+wTQSavgT7SrerPoy3I49ccLQu+UaUNPlOFteiRrZcMRwnNAHbPs
	pEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0xHmROc4l9w7Bn8Ja9lYoS6he35UNcmBfNwZsCn4CUA=;
	b=q7G3QYum7+mi70T05xcnxUpBKPvUwO8imQQHc3chyJxhKptkYVrx/odx90wHiqHx1B
	b+qJpL89GdBcHY/NSCbJoBWTbaljFWl23Yr0pOzAybmNPeYDJmU8mdFkXeatIej9Y4Pp
	nOS9Tngb2W4LKRHZpbTuOI71QCJ7rAGHPTCqRzJUOisKQjmWrX2y7HmrRYanYSEmpwD0
	nwseyWwwNTu00PqjHUvfaPwVuh3hMthA2XGM044xm0aosqNHXJr8pxsPAaFpfCOEvbVy
	R0vaCQ7H8QJhbs02I1pJfcuHqhtfEyukCLyQlNHD4uXTDfLslohNe1BYkiQDG3SCm53S
	JF7w==
X-Gm-Message-State: APzg51Ai1H0vGnBuun3NfWr29yUMZS/FGojaUHrwCNZPCt7udE30Zu5u
	YhvIbqcwdcGuiCkQhpIhjx+NpffbshQrZYoPaRWcqqHL
X-Google-Smtp-Source: ANB0VdaO0h2qG966+1oeNyKmZQziK/Wr1U7JzZR2R8zWldxxDcXo2PYUkkk5U4UdLBcTl4cebwctVuxGLL6DoHpYhTU=
X-Received: by 2002:a1c:bb0a:: with SMTP id
	l10-v6mr2350401wmf.32.1535145895828; 
	Fri, 24 Aug 2018 14:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20180807144843.26064-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20180807144843.26064-1-richard.purdie@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 Aug 2018 23:24:45 +0200
Message-ID: <CA+chaQc7p5Q2iknW+3mVKm6jSxo0E4GJuNYLPBrRYkC29mzD5w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Add sstate usage summary to the build
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
X-List-Received-Date: Fri, 24 Aug 2018 21:24:55 -0000
Content-Type: multipart/alternative; boundary="000000000000cca3ae05743501da"

--000000000000cca3ae05743501da
Content-Type: text/plain; charset="UTF-8"

This is nice addition, but maybe it would be worth explaining somewhere
what these numbers actually mean.

e.g. my current build shows:
Sstate summary: Wanted 181 Found 39 Missed 142 Current 279 (21% match, 69%
complete)

From quick look at the code my understanding is that:
1) Wanted = Found + Missed
2) Wanted is number of sstate covered tasks needed for current build, Found
is how many of them will be covered by existing sstate (fetched from
SSTATE_MIRROR or local) and match is just Found/Wanted
3) Current is most confusing for me as it is a sum of tasks covered either
by normal stamps or setscene and complete is then percentage of the tasks
which either doesn't need to be executed at all or will be covered by sstate
4) Neither of these is about not-sstate-covered tasks which for this build
was 1983 and 1574 were already covered by stamp files (as shown at the end
of the build shown bellow)

Am I close?

I'm used to meta/classes/buildstats-summary.bbclass output (unfortunately
after the build) which just shows 3 numbers per sstate covered task and
this new summary is a bit confusing for me.

NOTE: Tasks Summary: Attempted 1983 tasks of which 1574 didn't need to be
rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Uploading the report
/OE/build/oe-core/tmp-glibc/log/error-report/error_report_20180824202134.txt
to errors.yoctoproject.org:80
NOTE: Report submitted: 200 Your entry can be found here:
http://errors.yoctoproject.org/Errors/Build/66557/
NOTE: Build completion summary:
NOTE:   do_populate_sysroot: 8.1% sstate reuse(3 setscene, 34 scratch)
NOTE:   do_package: 0.0% sstate reuse(0 setscene, 33 scratch)
NOTE:   do_packagedata: 0.0% sstate reuse(0 setscene, 32 scratch)
NOTE:   do_package_write_ipk: 0.0% sstate reuse(0 setscene, 32 scratch)
NOTE:   do_populate_lic: 0.0% sstate reuse(0 setscene, 1 scratch)


On Tue, Aug 7, 2018 at 4:49 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Currently the user has no indication of how much sstate was already present
> or that would be used by the build. This change adds some summary
> information
> so that the user can see how much reuse is occurring. To fully work it
> needs some extra information from a recent bitbake commit but this is
> optional.
>
> When combined with bitbake --dry-run this feature can be used to check
> if sstate would be reused in a build.
>
> [YOCTO #12749]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sstate.bbclass | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 350d3107f59..6743becf071 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -892,6 +892,18 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash,
> sq_hashfn, d, siginfo=False):
>              evdata['found'].append( (sq_fn[task], sq_task[task],
> sq_hash[task], sstatefile ) )
>          bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
>
> +    # Print some summary statistics about the current task completion and
> how much sstate
> +    # reuse there was. Avoid divide by zero errors.
> +    total = len(sq_fn)
> +    currentcount = d.getVar("BB_SETSCENE_STAMPCURRENT_COUNT") or 0
> +    complete = 0
> +    if currentcount:
> +        complete = (len(ret) + currentcount) / (total + currentcount) *
> 100
> +    match = 0
> +    if total:
> +        match = len(ret) / total * 100
> +    bb.plain("Sstate summary: Wanted %d Found %d Missed %d Current %d
> (%d%% match, %d%% complete)" % (total, len(ret), len(missed), currentcount,
> match, complete))
> +
>      if hasattr(bb.parse.siggen, "checkhashes"):
>          bb.parse.siggen.checkhashes(missed, ret, sq_fn, sq_task, sq_hash,
> sq_hashfn, d)
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000cca3ae05743501da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is nice addition, but maybe it would be worth explain=
ing somewhere what these numbers actually mean.<div><br></div><div>e.g. my =
current build shows:<br><div>Sstate summary: Wanted 181 Found 39 Missed 142=
 Current 279 (21% match, 69% complete)<br></div></div><div><br></div><div>F=
rom quick look at the code my understanding is that:</div><div>1) Wanted =
=3D Found=C2=A0+ Missed</div><div>2) Wanted is number of sstate covered tas=
ks needed for current build, Found is how many of them will be covered by e=
xisting sstate (fetched from SSTATE_MIRROR or local) and match is just Foun=
d/Wanted</div><div>3) Current is most confusing for me as it is a sum of ta=
sks covered either by normal stamps or setscene and complete is then percen=
tage of the tasks which either doesn&#39;t need to be executed at all or wi=
ll be covered by sstate</div><div>4) Neither of these is about not-sstate-c=
overed tasks which for this build was 1983 and 1574 were already covered by=
 stamp files (as shown at the end of the build shown bellow)</div><div><br>=
</div><div>Am I close?</div><div><br></div><div>I&#39;m used to=C2=A0meta/c=
lasses/buildstats-summary.bbclass output (unfortunately after the build) wh=
ich just shows 3 numbers per sstate covered task and this new summary is a =
bit confusing for me.</div><div><br></div><div><div>NOTE: Tasks Summary: At=
tempted 1983 tasks of which 1574 didn&#39;t need to be rerun and 1 failed.<=
/div><div>NOTE: Writing buildhistory</div><div>NOTE: Uploading the report /=
OE/build/oe-core/tmp-glibc/log/error-report/error_report_20180824202134.txt=
 to <a href=3D"http://errors.yoctoproject.org:80">errors.yoctoproject.org:8=
0</a></div><div>NOTE: Report submitted: 200 Your entry can be found here: <=
a href=3D"http://errors.yoctoproject.org/Errors/Build/66557/">http://errors=
.yoctoproject.org/Errors/Build/66557/</a></div><div>NOTE: Build completion =
summary:</div><div>NOTE:=C2=A0 =C2=A0do_populate_sysroot: 8.1% sstate reuse=
(3 setscene, 34 scratch)</div><div>NOTE:=C2=A0 =C2=A0do_package: 0.0% sstat=
e reuse(0 setscene, 33 scratch)</div><div>NOTE:=C2=A0 =C2=A0do_packagedata:=
 0.0% sstate reuse(0 setscene, 32 scratch)</div><div>NOTE:=C2=A0 =C2=A0do_p=
ackage_write_ipk: 0.0% sstate reuse(0 setscene, 32 scratch)</div><div>NOTE:=
=C2=A0 =C2=A0do_populate_lic: 0.0% sstate reuse(0 setscene, 1 scratch)</div=
></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Tue, Aug 7, 2018 at 4:49 PM Richard Purdie &lt;<a href=3D"mailto:richar=
d.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Currently the user has no indi=
cation of how much sstate was already present<br>
or that would be used by the build. This change adds some summary informati=
on<br>
so that the user can see how much reuse is occurring. To fully work it<br>
needs some extra information from a recent bitbake commit but this is<br>
optional.<br>
<br>
When combined with bitbake --dry-run this feature can be used to check<br>
if sstate would be reused in a build.<br>
<br>
[YOCTO #12749]<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/classes/sstate.bbclass | 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index 350d3107f59..6743becf071 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -892,6 +892,18 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_has=
hfn, d, siginfo=3DFalse):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evdata[&#39;found&#39;].app=
end( (sq_fn[task], sq_task[task], sq_hash[task], sstatefile ) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.event.fire(bb.event.MetadataEvent(&quo=
t;MissedSstate&quot;, evdata), d)<br>
<br>
+=C2=A0 =C2=A0 # Print some summary statistics about the current task compl=
etion and how much sstate<br>
+=C2=A0 =C2=A0 # reuse there was. Avoid divide by zero errors.<br>
+=C2=A0 =C2=A0 total =3D len(sq_fn)<br>
+=C2=A0 =C2=A0 currentcount =3D d.getVar(&quot;BB_SETSCENE_STAMPCURRENT_COU=
NT&quot;) or 0<br>
+=C2=A0 =C2=A0 complete =3D 0<br>
+=C2=A0 =C2=A0 if currentcount:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 complete =3D (len(ret) + currentcount) / (tota=
l + currentcount) * 100<br>
+=C2=A0 =C2=A0 match =3D 0<br>
+=C2=A0 =C2=A0 if total:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D len(ret) / total * 100<br>
+=C2=A0 =C2=A0 bb.plain(&quot;Sstate summary: Wanted %d Found %d Missed %d =
Current %d (%d%% match, %d%% complete)&quot; % (total, len(ret), len(missed=
), currentcount, match, complete))<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if hasattr(bb.parse.siggen, &quot;checkhashes&quot;):<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.parse.siggen.checkhashes(missed, ret, =
sq_fn, sq_task, sq_hash, sq_hashfn, d)<br>
<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000cca3ae05743501da--
