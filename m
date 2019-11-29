Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2977F485
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 16:49:01 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id a67so26176909edf.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 08:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BsxpF1ygd8UevRZxUaRjRt2SrcWtOc9J+Q4EMp8oo+k=;
	b=vPZIi3NU+D9uN/s0uOfyUmckYV3gkqbGdF4inecRTAU94DEvv7EfjL6N5A9lb7YorI
	vrLLzCPwZptTDq4eZ2Ew+P4ljLDyOUWrtRVU55FM2P3hjjHEQZE+8nS1V6vad+Pz1IPo
	txJ0LldZM4zGpmg2Kp3N/e2mrD04u9/lB6ruG1hiI8vB2hrhlDI/0FtTV6Ao7N8bmFg2
	8CPf4RqUU4z+dsdtQ8qIZlsIn57cKxk7oj5MlaaCrO7as5p62a78kKlV7UKn+8eNJ/U6
	Ux56/lsy2WYGP76RGuRZJsrEosafCILIti+pI1CEDSkzKYNaOen+BuWMV+DT4m6Zp5It
	LhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BsxpF1ygd8UevRZxUaRjRt2SrcWtOc9J+Q4EMp8oo+k=;
	b=toZuFy8ezpfYnMQvR+kUutt/7dXsfpFoDGKs3J28qZ2hmept2gPKXrNnFq5zj13BJb
	ObQaABb0y/Bnnyiw1ZwBuhHCMZDChgIpjZU+qa4OSWKrBMwAbnbnLndsPdXfWTDCl2Mp
	mfKkzS4WDQDnJBrLRNX6A2npMGFyG/rQbstgp9csKVhF8MyimGrx/nVurkjJKtF2TGzV
	GMd/HGDgmNpPKcGROL64XCI7UP5fbmDJ61MGf4HlN1RhJAFmTuwPit+k6ttSAmNZs/PS
	0ELEOzsoOTLOexoZYDljYFOrQ3DZXfoBPb5T9q5x8I+VLkjjeabMJt5XYT5cb7/G/c0L
	HvOw==
X-Gm-Message-State: APjAAAUX2s74lYmbFabS6xiv9Bz1g1Yq6jbhAnHqcCSawlMe8OnsiBPe
	GLXdmrh+xxOB6Dx3AFJvN3tiD6jCKjAlqlRvgl8=
X-Google-Smtp-Source: APXvYqxW6HCPLRVSTWM9tHfTBcIZSi2Jw6EXSXrit/Z020yVklWMzeRXK2eIEP0K8lEImpXotH+Rx8Ie88e4HX3PBKI=
X-Received: by 2002:aa7:cd87:: with SMTP id x7mr46810735edv.153.1575046141907; 
	Fri, 29 Nov 2019 08:49:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1504036763.git.pkj@axis.com>
	<CAJ86T=VajsxSGRakyVVmTZcEWwwLaVZxKpcsE+ZU75bGrsUkbQ@mail.gmail.com>
	<70b15633357a418095d460b943d3e994@XBOX02.axis.com>
	<1504043397.2175.19.camel@linuxfoundation.org>
	<5ba32c0773d848ef8e6afb117a72abb0@XBOX02.axis.com>
	<CA+chaQeak4gD3C=jgxE-gg=9yf+g=4sgcHqP3ooMVRMJsbtO5w@mail.gmail.com>
In-Reply-To: <CA+chaQeak4gD3C=jgxE-gg=9yf+g=4sgcHqP3ooMVRMJsbtO5w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 29 Nov 2019 17:48:50 +0100
Message-ID: <CA+chaQdRJQ8i+a2Ko3_D7Gp=yAJvA5M5wCmZstMykip-x-FYbg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Avoid build failures due to setscene errors
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
X-List-Received-Date: Fri, 29 Nov 2019 16:49:01 -0000
Content-Type: multipart/alternative; boundary="000000000000cb165505987f011c"

--000000000000cb165505987f011c
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 30, 2017 at 9:54 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> I agree with this patchset and it would be OK with IGNORE_SETSCENE_ERRORS
> conditional as well.
>
> We're also sometimes seeing these errors, sometime anticipated when
> cleaning shared sstate-cache on NFS server sometimes unexpected when NFS or
> network goes down for a minute and for some builds it happens between
> sstate_checkhashes()  and using the sstate.
>
> We normally stop all jenkins builds, until the cleanup is complete (there
> is jenkins job doing the cleanup, so it puts jenkins into stop mode, waits
> for all current jobs to finish which can take hours, then performs the
> cleanup and cancels the stop mode), but we cannot stop hundreds of
> developers using the same sstate-cache in local builds (especially when we
> cannot really know when exactly the job will have free jenkins to perform
> the cleanup) - luckily in local builds it doesn't hurt so bad, because the
> developers are more likely to ignore the error as long as the image was
> created, but in jenkins builds when bitbake returns error we cannot easily
> distinguish this case of "RP is intentionally warning us that something
> went wrong with sstate, but everything was built correctly in the end" and
> "something failed in the build and we weren't able to recover from that,
> maybe even the image wasn't created" - so we don't trigger the follow up
> actions like announcing new official builds or parsing release notes or
> automated testing.
>
> Yes we could add more logic to these CI jobs, to grep the logs to decide
> if this error was the only one which caused the bitbake to return error
> code and ignore the returned error in such case, but simple variable is
> easier to maintain (even for the cost of forking bitbake and oe-core) and
> will work for local builds as well.
>

 I was using these 2 changes in my fork of oe-core and bitbake since they
were sent to the list, but today after getting a bunch of errors like this
from build which unfortunately wasn't using my forks and few questions
about why these errors aren't ignored from fellow developers I've finally
found time to improve our CI jobs to deal with this and ignore the bitbake
return code if it's reporting failure only because of these setscene
fetcher failures.

If someone needs similar work around for bitbake behavior, here is what I
did:
https://github.com/webOS-ports/jenkins-jobs/pull/12
yes, it's ugly, but it seems to work and is a bit better than forking
oe-core and bitbake just because of this issue.

Regards,

--000000000000cb165505987f011c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Aug 30, 2017 at 9:54 AM Martin Ja=
nsa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr">I agree with this patchset and it =
would be OK with=C2=A0<span style=3D"font-size:12.8px">IGNORE_SETSCENE_ERRO=
RS conditional as well.</span><div><span style=3D"font-size:12.8px"><br></s=
pan></div><div><span style=3D"font-size:12.8px">We&#39;re also sometimes se=
eing these errors, sometime anticipated when cleaning shared sstate-cache o=
n NFS server sometimes unexpected when NFS or network goes down for a minut=
e and for some builds it happens between=C2=A0</span><span style=3D"font-si=
ze:12.8px">sstate_checkhashes()</span><span style=3D"font-size:12.8px">=C2=
=A0 and using the sstate.</span></div><div><span style=3D"font-size:12.8px"=
><br></span></div><div><span style=3D"font-size:12.8px">W</span><span style=
=3D"font-size:12.8px">e normally stop all jenkins builds, until the cleanup=
 is complete (there is jenkins job doing the cleanup, so it puts jenkins in=
to stop mode, waits for all current jobs to finish which can take hours, th=
en performs the cleanup and cancels the stop mode), but we cannot stop hund=
reds of developers using the same sstate-cache in local builds (especially =
when we cannot really know when exactly the job will have free jenkins to p=
erform the cleanup) - luckily in local builds it doesn&#39;t hurt so bad, b=
ecause the developers are more likely to ignore the error as long as the im=
age was created, but in jenkins builds when bitbake returns error we cannot=
 easily distinguish this case of &quot;RP is intentionally warning us that =
something went wrong with sstate, but everything was built correctly in the=
 end&quot; and &quot;something failed in the build and we weren&#39;t able =
to recover from that, maybe even the image wasn&#39;t created&quot; - so we=
 don&#39;t trigger the follow up actions like announcing new official build=
s or parsing release notes or automated testing.</span></div><div><span sty=
le=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-size:12.8=
px">Yes we could add more logic to these CI jobs, to grep the logs to decid=
e if this error was the only one which caused the bitbake to return error c=
ode and ignore the returned error in such case, but simple variable is easi=
er to maintain (even for the cost of forking bitbake and oe-core) and will =
work for local builds as well.</span></div></div></blockquote><div><br></di=
v><div>=C2=A0I was using these 2 changes in my fork of oe-core and bitbake =
since they were sent to the list, but today after getting a bunch of errors=
 like this from build which unfortunately wasn&#39;t using my forks and few=
 questions about why these errors aren&#39;t ignored from fellow developers=
 I&#39;ve finally found time to improve our CI jobs to deal with this and i=
gnore the bitbake return code if it&#39;s reporting failure only because of=
 these setscene fetcher failures.</div><div><br></div><div>If someone needs=
 similar work around for bitbake behavior, here is what I did:</div><div><a=
 href=3D"https://github.com/webOS-ports/jenkins-jobs/pull/12">https://githu=
b.com/webOS-ports/jenkins-jobs/pull/12</a><br></div><div>yes, it&#39;s ugly=
, but it seems to work and is a bit better than forking oe-core and bitbake=
 just because of this issue.</div><div><br></div><div>Regards,</div></div><=
/div>

--000000000000cb165505987f011c--
