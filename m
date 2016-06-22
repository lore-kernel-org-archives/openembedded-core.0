Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8EC62133
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 22:35:55 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id p10so85460583qke.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 15:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=oCGg9Bww6iySOC+AGiYhpmhTF8jMCgM+GvMPnVhi3a0=;
	b=0iaV2dUGV3UeF7sF3x+oS1vt6Kc0Ex4RAMDpZSpUGdd+NTSM6M887FYxKplLgiSoip
	7CsvvOH5IzjiDJytCS9hz2EyUc0HcelLiMbM6I3RI79DF002aW4ENKq9WhDvlTZmj0mw
	PPWvCIEKjvkeID7n/HN2htQ0h/rcNO2lEzhE9o5Um1TkCx+YTrRz2IRK4ScKkMbmXPmB
	khGtjXzKTgf3Jhs16iXm5nZ3B+XFTQ1FdsYUU2bANA4qD+3wyLr1fX7KWnPz7QTEFWaH
	hjo4djHr1S1hzzXNFrTlNBYjeiyViaikCU77awO9wARew/niFdOpk6dozst5iSe4IdIb
	04ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=oCGg9Bww6iySOC+AGiYhpmhTF8jMCgM+GvMPnVhi3a0=;
	b=d2oIWVLcb8NGM+Y7NzXSgOT1TSmg2bEsYTgeye1GBcrxoKGlNw0YCe6hJDo/IPVaUd
	u3znxQCHgl6q/eTBf7uo+628ovsPlJbRwXoKvtllTa7lYzd+psKBYPa4o0BxKzGFfHTs
	/k6ES48c7xGpx5YTk2QDxSSjapJPGMVUv8lYrreJ5lvbqaI58RfpWu0A9InNohjsuOGF
	M3tgyShMiZvWki0ERYkK5N+3tt5vKEzA299diANCL2BTV7euZtF0IziKotFxMJq67hQh
	jM04KlLNibmLQSUxbbBfZxzAGncLigkSSXjIONQE5VTiV0JHvaNL6kBSVRDqlUegGfGT
	5dJQ==
X-Gm-Message-State: ALyK8tJSvakQmPpqmlsfY3x8bHC4yLDEpFhGsRpmcxphn4VVjjcVc+p6JS8ACkSaJwBOsCFOUzgCYbvaUvpHAw==
MIME-Version: 1.0
X-Received: by 10.55.141.134 with SMTP id p128mr37625351qkd.102.1466634956077; 
	Wed, 22 Jun 2016 15:35:56 -0700 (PDT)
Received: by 10.55.8.133 with HTTP; Wed, 22 Jun 2016 15:35:55 -0700 (PDT)
Received: by 10.55.8.133 with HTTP; Wed, 22 Jun 2016 15:35:55 -0700 (PDT)
In-Reply-To: <1466632764-22540-1-git-send-email-jslater@windriver.com>
References: <1466632764-22540-1-git-send-email-jslater@windriver.com>
Date: Wed, 22 Jun 2016 15:35:55 -0700
Message-ID: <CAMKF1soa5wBYFyFV0sqxsN_0bpjTjpQ==Aow0Ui7ZAAhh-Mp=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] blacklist: add BPNBLACKLIST support
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
X-List-Received-Date: Wed, 22 Jun 2016 22:35:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c081fe4927fb60535e58f4b

--94eb2c081fe4927fb60535e58f4b
Content-Type: text/plain; charset=UTF-8

On Jun 22, 2016 2:59 PM, "Joe Slater" <jslater@windriver.com> wrote:
>
> We have encountered some issues with the use of PNBLACKLIST in recipes.
> In particular, PNBLACKLIST[pkg] will not suppress building of lib32-pkg
> or lib64-pkg so world builds can fail unexpectedly.
>
> One solution could be to implement BPNBLACKLIST[] which checks BPN instead
> of PN when a recipe is being parsed.  I have included a patch to do this.
>
> If this were adopted, there are many recipes under meta-openembedded that
> should probably changed to use BPNBLACKLIST instead of PNBLACKLIST.

Bpn will also mean native and nativesdk among others. I think its better to
list multilibs explicitly.

>
> Joe Slater (1):
>   blacklist: add BPNBLACKLIST support
>
>  meta/classes/blacklist.bbclass |   24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--94eb2c081fe4927fb60535e58f4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jun 22, 2016 2:59 PM, &quot;Joe Slater&quot; &lt;<a href=3D"mailto:jslat=
er@windriver.com">jslater@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; We have encountered some issues with the use of PNBLACKLIST in recipes=
.<br>
&gt; In particular, PNBLACKLIST[pkg] will not suppress building of lib32-pk=
g<br>
&gt; or lib64-pkg so world builds can fail unexpectedly.<br>
&gt;<br>
&gt; One solution could be to implement BPNBLACKLIST[] which checks BPN ins=
tead<br>
&gt; of PN when a recipe is being parsed.=C2=A0 I have included a patch to =
do this.<br>
&gt;<br>
&gt; If this were adopted, there are many recipes under meta-openembedded t=
hat<br>
&gt; should probably changed to use BPNBLACKLIST instead of PNBLACKLIST.</p=
>
<p dir=3D"ltr">Bpn will also mean native and nativesdk among others. I thin=
k its better to list multilibs explicitly.</p>
<p dir=3D"ltr">&gt;<br>
&gt; Joe Slater (1):<br>
&gt; =C2=A0 blacklist: add BPNBLACKLIST support<br>
&gt;<br>
&gt; =C2=A0meta/classes/blacklist.bbclass |=C2=A0 =C2=A024 ++++++++++++++++=
++++----<br>
&gt; =C2=A01 file changed, 20 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 1.7.9.5<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
</p>

--94eb2c081fe4927fb60535e58f4b--
