Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 69E1C79005
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 09:12:52 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id m11-v6so24618858oic.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 02:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PonEhCvuAJD9kGFg3W68iSfAcBh6tCA4B2LL08ZQKhc=;
	b=cKoCWWfXX8c1Zws7zCb08D2uw9jL6j1IaTwpYM/Ts/wY6wQxyvoVobU8nl4+BcqJnO
	p88F5rnh7Ao68dBA8QmqMiRyzDTgzRqa96YzGYrvyPiYI3npnOuGbsMPvd6Xedb+S6GO
	dLcGP9popgA1dnhCPvlj6WtlhekNOGRofLgh4g5KY9jGb4qQ0Vco4cebKR90ste5cXWw
	CDB+mcVCVyam9A1ZnzhZJcYvJ9snhVr7uMN8YmNHfJzq4xKOSr1x/w+8K/JShd9Yt5Xa
	9W1c63Qq6nmBIWP9CTVwGQfIajQeMo/eUVC2OYolIbtTXAcdx++D+DUGg9l1KWXxQsgM
	o1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PonEhCvuAJD9kGFg3W68iSfAcBh6tCA4B2LL08ZQKhc=;
	b=RYT9Qz3t+C6KQ2jJpqvJStCvS8wqPpF3WxPDICDi4u37msfvlROWE3zsS2FXWlGejK
	UBzxiPfIOj6/CPO3BjJp4wX2mr2xQ3ieJVPaJJ0yFQDEvB+mi6PWW8lLMENslReijzpb
	HqwsXSPQ1fy2VhKxavwp1hhM+sLyVBaOjtSGR3kgYSy/GpDwfsG5xLj22XeRDKwQPDeD
	839u0GFJn56m9f82j1PCBJbC/vVmExYZ5Jm5Jr88OuvPn6BFM7jA3utwiBAT6pj3uNlA
	6ozB1gIh7lMy5B4MSbiWaKRfkxzLwDC09xQX/6sTM/lQMeqnqaAhaV/uBQFcSJqrL69O
	b9GQ==
X-Gm-Message-State: AOUpUlENfQqlHRPzq9sWQxzJiGW8Fv08UtictX9yaXf4eqENfr6EdmXY
	0/41JAyrmg632/LkgIpkRtyMJk92FY9G6X54908=
X-Google-Smtp-Source: AA+uWPxpDueVmQ2Z/IGO0YtOvW+IGtrs1SFk9YJxvlqyIAGvW8BYcEgW8iL0QEe4fcJUDDU8UQNvkU1oKxRwYQyn2ts=
X-Received: by 2002:a54:4d9d:: with SMTP id
	y29-v6mr13734096oix.273.1534756373243; 
	Mon, 20 Aug 2018 02:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
	<8a3a6d85-3c46-3144-9530-7487ba773a2f@windriver.com>
In-Reply-To: <8a3a6d85-3c46-3144-9530-7487ba773a2f@windriver.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 20 Aug 2018 21:12:42 +1200
Message-ID: <CADySD0GXj7gKC0VsXzKprf2e1VapwHwCVnZs5_9W-4ekwGVZXg@mail.gmail.com>
To: Qi.Chen@windriver.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][sumo][master][PATCH 1/2] bitbake.conf: add PERSISTENT_LOG_DIR variable
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
X-List-Received-Date: Mon, 20 Aug 2018 09:12:52 -0000
Content-Type: multipart/alternative; boundary="00000000000071aaf10573da5006"

--00000000000071aaf10573da5006
Content-Type: text/plain; charset="UTF-8"

Initially I thought of doing that but then dropped it because it would
create a dependency on syslog configuration file.
If in future syslog configuration parameter (LOGFILE) gets renamed, then we
need to make corresponding change as well.

I think creating /var/log as a link is a less dependent change.

Let me know your thoughts.

Regards
Ankur

On Mon, Aug 20, 2018 at 1:49 PM ChenQi <Qi.Chen@windriver.com> wrote:

> The requirement is to put logs into directories other than /var/log.
> Could it be achieved by modifying the syslog daemon configuration file
> (e.g. /etc/syslog.conf) to replace /var/log with the specified
> directory. Maybe the corresponding logrotate configuration file also
> needs to be modified.
>
> Best Regards,
> Chen Qi
>
> On 08/18/2018 08:59 AM, Ankur Tyagi wrote:
> > This variable is only respected when VOLATILE_LOG_DIR is "no".
> >
> > The default value is "" which results in the /var/log being log
> directory.
> >
> > The user could override this value to a path e.g "/home/root/log" which
> > results /var/log being a link pointing to /home/root/log directory on
> > persistent storage.
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >   meta/conf/bitbake.conf | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index e5dc1ac..9db22c8 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -88,6 +88,8 @@ ROOT_HOME ??= "/home/root"
> >   # If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log
> links to /var/volatile/log.
> >   # If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is
> on persistent storage.
> >   VOLATILE_LOG_DIR ?= "yes"
> > +# If VOLATILE_LOG_DIR is false and PERSISTENT_LOG_DIR is set, /var/log
> links to PERSISTENT_LOG_DIR
> > +PERSISTENT_LOG_DIR ??= ""
> >
> >   ##################################################################
> >   # Architecture-dependent build variables.
>
>
>

--00000000000071aaf10573da5006
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Initially I thought of doing that but then dropped it b=
ecause it would create a dependency on syslog configuration file.</div><div=
 class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">I=
f in future syslog configuration parameter (LOGFILE) gets renamed, then we =
need to make corresponding change as well.</div><div class=3D"gmail_default=
" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"=
gmail_default" style=3D"font-family:arial,helvetica,sans-serif">I think cre=
ating /var/log as a link is a less dependent change.</div><div class=3D"gma=
il_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div=
 class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">L=
et me know your thoughts.</div><div class=3D"gmail_default" style=3D"font-f=
amily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" st=
yle=3D"font-family:arial,helvetica,sans-serif">Regards</div><div class=3D"g=
mail_default" style=3D"font-family:arial,helvetica,sans-serif">Ankur</div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Aug 20, 2018 at 1:49=
 PM ChenQi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">The requirement is to put logs into directories other than /var/log.<br>
Could it be achieved by modifying the syslog daemon configuration file <br>
(e.g. /etc/syslog.conf) to replace /var/log with the specified <br>
directory. Maybe the corresponding logrotate configuration file also <br>
needs to be modified.<br>
<br>
Best Regards,<br>
Chen Qi<br>
<br>
On 08/18/2018 08:59 AM, Ankur Tyagi wrote:<br>
&gt; This variable is only respected when VOLATILE_LOG_DIR is &quot;no&quot=
;.<br>
&gt;<br>
&gt; The default value is &quot;&quot; which results in the /var/log being =
log directory.<br>
&gt;<br>
&gt; The user could override this value to a path e.g &quot;/home/root/log&=
quot; which<br>
&gt; results /var/log being a link pointing to /home/root/log directory on<=
br>
&gt; persistent storage.<br>
&gt;<br>
&gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.c=
om" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/conf/bitbake.conf | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index e5dc1ac..9db22c8 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -88,6 +88,8 @@ ROOT_HOME ??=3D &quot;/home/root&quot;<br>
&gt;=C2=A0 =C2=A0# If set to boolean true (&#39;yes&#39;, &#39;y&#39;, &#39=
;true&#39;, &#39;t&#39;, &#39;1&#39;), /var/log links to /var/volatile/log.=
<br>
&gt;=C2=A0 =C2=A0# If set to boolean false (&#39;no&#39;, &#39;n&#39;, &#39=
;false&#39;, &#39;f&#39;, &#39;0&#39;), /var/log is on persistent storage.<=
br>
&gt;=C2=A0 =C2=A0VOLATILE_LOG_DIR ?=3D &quot;yes&quot;<br>
&gt; +# If VOLATILE_LOG_DIR is false and PERSISTENT_LOG_DIR is set, /var/lo=
g links to PERSISTENT_LOG_DIR<br>
&gt; +PERSISTENT_LOG_DIR ??=3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0##########################################################=
########<br>
&gt;=C2=A0 =C2=A0# Architecture-dependent build variables.<br>
<br>
<br>
</blockquote></div></div>

--00000000000071aaf10573da5006--
