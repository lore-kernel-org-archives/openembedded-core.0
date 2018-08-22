Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id B23E06011A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:11:50 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id z185-v6so1335409oia.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 01:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=01xyIG/8xvSmJD/fUWIncDTjtWKe0bg6dPjXNkFXdKI=;
	b=h5HuzrIWRbotoIGrFA9abTlzjJwmeyQGTUNb42jPZ6l8cJ58Sbpwmf8EaiGwCHzdZy
	bQHxjA5p+1sQHsI/ctvXu+H8UZd7RgBRNPCY3XZAXM4/+k0rtpAPWWWWibPYwhhPQFLi
	izPtSOWF5wi65EFezUkZ9WGFx12bt+kcOz6uC3P1Zqb50IF3JVnVGnEKQ/VMnnxvzel7
	syRIB1IXY0cBsYW9+XGN6hvthCa1QCPrpmJrScsR3iZGPBKnMjzTezUcl+xhTlmKiTPu
	6mWW3Evw1dPafx1crhqlTdZYMTwEilGKzp8fQTGm5sCfhJwxvzUodZ1D5FFvaC0l9w4P
	w6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=01xyIG/8xvSmJD/fUWIncDTjtWKe0bg6dPjXNkFXdKI=;
	b=EsHkKsBI6rDe/dTjokzLq1CmZYIOs8wBVkRuR9Ga5rrSsV2M1ncZC1XrcrWzjYWBKr
	O6/soLK9B+2butCdtVQEWdDrtAf1Igkgy7mT5FjzYIRSt/SowdxlEc5Re92DiV9A4lNC
	ldaYZGKYEtPcyDycnY22bQZreMENy0zvMlapm96w4qZf3LpU0FfJG6qsCZLzupBH7geS
	ups5jq844a6XCmYsXKMxy0BGrE9BVIqpNm8oYj9BnOIWksGRE81T/hNPdWCTtAaKxQcA
	wVqQtgkTGpGDXM0I4RM4pQYdM0xoXxRZ7PwfQOMzpzyhkdnirh/NmyVduKQF9YTZA+XL
	QoWA==
X-Gm-Message-State: APzg51BGmq5flWVNbxgug2j0YqgridI9KLXOXSbAPRDuWwCjSQ5gFrWh
	fN/2/Hs4DqYNkGqLxS39OKEpjibA334VnjClPaQ=
X-Google-Smtp-Source: ANB0VdYBCOevUf/bGUFhw5naB+nNyz2f7tqW7vm4SS9XCliAK1ILgcywPG7c5fQ3c5OSk5A0JHZbl8Vj/GqPda4j9aE=
X-Received: by 2002:aca:ebcc:: with SMTP id
	j195-v6mr3163603oih.298.1534925511445; 
	Wed, 22 Aug 2018 01:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
	<8a3a6d85-3c46-3144-9530-7487ba773a2f@windriver.com>
	<CADySD0GXj7gKC0VsXzKprf2e1VapwHwCVnZs5_9W-4ekwGVZXg@mail.gmail.com>
In-Reply-To: <CADySD0GXj7gKC0VsXzKprf2e1VapwHwCVnZs5_9W-4ekwGVZXg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 22 Aug 2018 20:11:38 +1200
Message-ID: <CADySD0Ef8wzLji9LLmDZ=Yp8e5mfzupnBkEHh6QCpUKfBg_oWg@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 08:11:50 -0000
Content-Type: multipart/alternative; boundary="000000000000ddd42e057401b18a"

--000000000000ddd42e057401b18a
Content-Type: text/plain; charset="UTF-8"

Ping

Regards
Ankur

On Mon 20 Aug, 2018, 9:12 PM Ankur Tyagi, <ankur.tyagi85@gmail.com> wrote:

> Initially I thought of doing that but then dropped it because it would
> create a dependency on syslog configuration file.
> If in future syslog configuration parameter (LOGFILE) gets renamed, then
> we need to make corresponding change as well.
>
> I think creating /var/log as a link is a less dependent change.
>
> Let me know your thoughts.
>
> Regards
> Ankur
>
> On Mon, Aug 20, 2018 at 1:49 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
>> The requirement is to put logs into directories other than /var/log.
>> Could it be achieved by modifying the syslog daemon configuration file
>> (e.g. /etc/syslog.conf) to replace /var/log with the specified
>> directory. Maybe the corresponding logrotate configuration file also
>> needs to be modified.
>>
>> Best Regards,
>> Chen Qi
>>
>> On 08/18/2018 08:59 AM, Ankur Tyagi wrote:
>> > This variable is only respected when VOLATILE_LOG_DIR is "no".
>> >
>> > The default value is "" which results in the /var/log being log
>> directory.
>> >
>> > The user could override this value to a path e.g "/home/root/log" which
>> > results /var/log being a link pointing to /home/root/log directory on
>> > persistent storage.
>> >
>> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> > ---
>> >   meta/conf/bitbake.conf | 2 ++
>> >   1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> > index e5dc1ac..9db22c8 100644
>> > --- a/meta/conf/bitbake.conf
>> > +++ b/meta/conf/bitbake.conf
>> > @@ -88,6 +88,8 @@ ROOT_HOME ??= "/home/root"
>> >   # If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log
>> links to /var/volatile/log.
>> >   # If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is
>> on persistent storage.
>> >   VOLATILE_LOG_DIR ?= "yes"
>> > +# If VOLATILE_LOG_DIR is false and PERSISTENT_LOG_DIR is set, /var/log
>> links to PERSISTENT_LOG_DIR
>> > +PERSISTENT_LOG_DIR ??= ""
>> >
>> >   ##################################################################
>> >   # Architecture-dependent build variables.
>>
>>
>>

--000000000000ddd42e057401b18a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ping<div dir=3D"auto"><br></div><div dir=3D"auto">Regards=
</div><div dir=3D"auto">Ankur</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">On Mon 20 Aug, 2018, 9:12 PM Ankur Tyagi, &lt;<a href=3D"mail=
to:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_defaul=
t" style=3D"font-family:arial,helvetica,sans-serif">Initially I thought of =
doing that but then dropped it because it would create a dependency on sysl=
og configuration file.</div><div class=3D"gmail_default" style=3D"font-fami=
ly:arial,helvetica,sans-serif">If in future syslog configuration parameter =
(LOGFILE) gets renamed, then we need to make corresponding change as well.<=
/div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans=
-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,h=
elvetica,sans-serif">I think creating /var/log as a link is a less dependen=
t change.</div><div class=3D"gmail_default" style=3D"font-family:arial,helv=
etica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-fami=
ly:arial,helvetica,sans-serif">Let me know your thoughts.</div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-s=
erif">Regards</div><div class=3D"gmail_default" style=3D"font-family:arial,=
helvetica,sans-serif">Ankur</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr">On Mon, Aug 20, 2018 at 1:49 PM ChenQi &lt;<a href=3D"mailto:Qi.Chen@=
windriver.com" target=3D"_blank" rel=3D"noreferrer">Qi.Chen@windriver.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
e requirement is to put logs into directories other than /var/log.<br>
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
om" target=3D"_blank" rel=3D"noreferrer">ankur.tyagi85@gmail.com</a>&gt;<br=
>
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
</blockquote></div>

--000000000000ddd42e057401b18a--
