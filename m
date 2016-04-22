Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2A560116
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 23:18:35 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id bi2so25836151igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 16:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=6a87BPTkvIp5dU9tCj47EzE6vbramwMZxBIfJCj/A58=;
	b=Q7xXOBKCzihLln2mGkBctWgcV/t3+pqB9oxsUa/tZ9wxPo87cWdLJu/RjTTuDguhJ7
	es+sSdVvY9a1DdG2A4+SHY4zh2ve3MKQtcDHLNyIZnhEiP/cryV7uSyJNVverBsYGET3
	TftFsGclXqVFUfyokQb4xY4oaDCAXPnG9WvoWhHqqwVibevJoZdB8LahkW9xGsON9CSm
	sS+TPO7S87OVqouQXucO10nBbiREM7l2138sHi1PDzaGZ4THoR7I28gLPep35sf+bT+C
	PPTn3EkMgBtDWWONXxG/+9EA8neQpANCjJMHqW4Dplcp/nz5o+HYCd2C8QAn6dVsIzSS
	nt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=6a87BPTkvIp5dU9tCj47EzE6vbramwMZxBIfJCj/A58=;
	b=KmxRWwsk5ItCyNTJzpbZ583RNGogYr2LrGZzzdbq6GWgLmz5MjqbSXV13ZBIAVB32F
	ztg4hWb0yE+l7OyAWHKlFz6Wn0Nd8jq6IkiWs/l44v3CWMXd6adiRvswewDJa4xlpUlh
	bjW5qigUlVGlvah3vCp2LvcS404dJPNEXtEj1xA8rDT19wWqxFdfGXb6j9TfIyZsjOzZ
	iFZu6ohtJvx7dh0RbcTJbUzDTXYPIwhrbk9iU7X9Zcf2YR7+bEMbVVFuCBKUYTYpgdW6
	INbW/Q4Z9t1ZKAOhKHmjbiATUvCTlcqYmWv66T8TXcSHeucDv7wwSJqx8Wh0qPXhx9/2
	kkrA==
X-Gm-Message-State: AOPr4FVsBcNbp6Vgg0k1VmS6ohDphz9E+R+otm9PGSdJrGDI5sym7BFWxLzdxcKzjB6LUCOpaRyUlf+3feZ2HQ==
X-Received: by 10.50.221.169 with SMTP id qf9mr164168igc.13.1461367116612;
	Fri, 22 Apr 2016 16:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.20.1604221835420.5850@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.20.1604221835420.5850@localhost.localdomain>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 22 Apr 2016 23:18:27 +0000
Message-ID: <CABcZAN=Lnurd0rabaCTfs0+cOiQvTaaWL2pSzBmsho=joZjzmA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: precise details on processing of multiple .bbappend files across multiple layers?
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
X-List-Received-Date: Fri, 22 Apr 2016 23:18:39 -0000
Content-Type: multipart/alternative; boundary=f46d042ac020df4ca805311b0b82

--f46d042ac020df4ca805311b0b82
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 22, 2016 at 3:48 PM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   i realize i should know the answer to this, but it's friday and i'm
> tired. i want to know the precise processing order for the bbappend
> files for a single recipe over multiple layers. (i realize it's
> already a bad design if i have so many bbappend files for the same
> recipe that i get confused knowing how they're processed. :-)
>
>   if i have a recipe, say, rday_1.2.3.bb, and numerous rday*bbappend
> files spread across several layers, i already know that those layers
> are processed in increasing priority, so that higher-priority layers
> will overwrite the settings of lower-priority layers. so far, so good.
>
>   now, in each layer, the selection of any bbappend file will be based
> on specificity, so in my case, selection order might be:
>
>   * rday_1.2.3.bbappend
>   * rday_1.%.bbappend
>   * rday_%.bbappend
>
> and as long as that's true, i'm assuming that search order is
> restarted for each layer, so that if i have:
>
>   * layer priority 5, rday_1.2.%.bbappend
>   * layer priority 6, rday_1.%.bbappend
>
> the first of the above will be processed, but will be superseded by
> the second even though it is a more generic wildcard, correct?
>

Yes, the specificity of the append isn't a factor in ordering today, as far
as I know.


>   finally, if i have multiple layers with the same priority, what is
> the processing order of bbappend files there? is it random? based on
> wildcard specificity?
>

You should treat it as undefined. Don't rely on it. I *think* a recent
patch went in to at least make it deterministic by sorting in some fashion,
but afaik that's not guaranteed, and wasn't true in the past.

--f46d042ac020df4ca805311b0b82
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri=
, Apr 22, 2016 at 3:48 PM Robert P. J. Day &lt;<a href=3D"mailto:rpjday@cra=
shcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
=C2=A0 i realize i should know the answer to this, but it&#39;s friday and =
i&#39;m<br>
tired. i want to know the precise processing order for the bbappend<br>
files for a single recipe over multiple layers. (i realize it&#39;s<br>
already a bad design if i have so many bbappend files for the same<br>
recipe that i get confused knowing how they&#39;re processed. :-)<br>
<br>
=C2=A0 if i have a recipe, say, <a href=3D"http://rday_1.2.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">rday_1.2.3.bb</a>, and numerous rday*bbappend<br=
>
files spread across several layers, i already know that those layers<br>
are processed in increasing priority, so that higher-priority layers<br>
will overwrite the settings of lower-priority layers. so far, so good.<br>
<br>
=C2=A0 now, in each layer, the selection of any bbappend file will be based=
<br>
on specificity, so in my case, selection order might be:<br>
<br>
=C2=A0 * rday_1.2.3.bbappend<br>
=C2=A0 * rday_1.%.bbappend<br>
=C2=A0 * rday_%.bbappend<br>
<br>
and as long as that&#39;s true, i&#39;m assuming that search order is<br>
restarted for each layer, so that if i have:<br>
<br>
=C2=A0 * layer priority 5, rday_1.2.%.bbappend<br>
=C2=A0 * layer priority 6, rday_1.%.bbappend<br>
<br>
the first of the above will be processed, but will be superseded by<br>
the second even though it is a more generic wildcard, correct?<br></blockqu=
ote><div><br></div><div>Yes, the specificity of the append isn&#39;t a fact=
or in ordering today, as far as I know.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
=C2=A0 finally, if i have multiple layers with the same priority, what is<b=
r>
the processing order of bbappend files there? is it random? based on<br>
wildcard specificity?<br></blockquote><div><br></div><div>You should treat =
it as undefined. Don&#39;t rely on it. I *think* a recent patch went in to =
at least make it deterministic by sorting in some fashion, but afaik that&#=
39;s not guaranteed, and wasn&#39;t true in the past.</div></div></div>

--f46d042ac020df4ca805311b0b82--
