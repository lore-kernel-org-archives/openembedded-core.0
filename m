Return-Path: <avery.brian@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 894C171AB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 15:01:42 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id e64so34481821pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 May 2017 08:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+qNJeLbwjA6TNOjJlOMrc4RvAg/m5ChfsWnY79DPzo0=;
	b=lEgCukjRgnqNNJWeXdWFYD0jQtR7bCl3XDpEjMPfNdJ+kfmRI3kTL3gl32gMcvha0s
	UF0vklORaiKSUE7a03VpdnXq0w2SLX98a/Qge5l5fgavAokx8NYO4wvXke5CFG16zAes
	ZAGe8zr+ciQ4DXphdH5p+68R2m9ppmm9GBq4BnkABfZyA+MwEneXsGW3R5pHmjS8jzCJ
	5bre9LPpFCYiHyM14OTNxlPwH/tv7EDtaUiDH76hE5WsQEc7KPAiQaXHpRBdjRT7VwRc
	oP4B5/ZFkFoIxAqbnC9oZ2IXUWDswcqSZLjQQfbY9JW8r4vv8RoufHaLcca69Sb8clK6
	VnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+qNJeLbwjA6TNOjJlOMrc4RvAg/m5ChfsWnY79DPzo0=;
	b=YxtwbQb2IsmB5xaGvzoOIqntKGitip7EV4cS8UeaLBclm3rlUA2N/EYmqwmv21KFQu
	ib4Wy4FGmjpASvt2OyiBQYts8UocuIMMgeBeG9STQcORNMj2DDEbANzV0Gt1NKxwDtyG
	NxwTwTYkUBTCkxQ8z0EQUXbJQR6qORcAg7bFMBH9ZITVdOpgZM5MB091GDAN/jYq51n2
	6fZ2Ba3Ew9o+cLCK8yZvYDu/jzqpnw3UUwxF3VgC5kfwJR9aoNSas7519bd11WKDwltl
	nQLFyCit8cPt4W+b2ZvVXl128sEEb6qPDkINyz9p3CCPEdESkpXQ4dKSMd3pz9t+X/Gk
	uOvw==
X-Gm-Message-State: AN3rC/5kg1EoP4eRzsdHyDQO+AIO5xyTSMZH9u3ozKnB1zsdXkZPcswu
	9jTG7fVkxYWMhAJUpS0Qv7PtCIqUjA==
X-Received: by 10.98.78.193 with SMTP id c184mr32418529pfb.85.1494255703526;
	Mon, 08 May 2017 08:01:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.151.140 with HTTP; Mon, 8 May 2017 08:01:42 -0700 (PDT)
In-Reply-To: <8acd4c6d-ff42-de53-b9fa-313926a7cb0e@xevo.com>
References: <cover.1493674443.git.brian.avery@intel.com>
	<97028d3f45e62ba1e84b867d97fe5a55e0fc1d9f.1493674443.git.brian.avery@intel.com>
	<8acd4c6d-ff42-de53-b9fa-313926a7cb0e@xevo.com>
From: Brian Avery <avery.brian@gmail.com>
Date: Mon, 8 May 2017 08:01:42 -0700
Message-ID: <CAKV_0ejGHDPuREHZh_dwAQTEQwRT3AvA3pYn7ZquOWTyYOqotg@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Jan Kiszka <jan.kiszka@web.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] tcf-agent: add -USR2 to stop/kill initscript
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
X-List-Received-Date: Mon, 08 May 2017 15:01:42 -0000
Content-Type: multipart/alternative; boundary=94eb2c03beee6996c7054f048429

--94eb2c03beee6996c7054f048429
Content-Type: text/plain; charset=UTF-8

Agreed.  I didn't see his patch, when I did the fix (and didn't check again
when posting the fix).  Amusing we did it at the same time.  I'm fine with
either patch as the loop shouldn't be triggered in general, nor do I think
it would really help ...

-brian
an intel employee

On Mon, May 1, 2017 at 4:15 PM, Martin Kelly <mkelly@xevo.com> wrote:

> Looks like this is addressing the same problem as Jan's patch from earlier
> today. I think the differences are:
>
> - kill vs start-stop-daemon
>
> - Jan removed the retry loop while this patch does not
>
>
> On 05/01/2017 02:59 PM, brian avery wrote:
>
>> The current initscript was lacking a -USR2 signal in the stop section.
>> This resulted in /etc/init.d/tcf-agent stop; taking roughly 10 seconds
>> then failing to kill the tcf-agent process. This patch brings us in line
>> with how upstream stops the agent.
>>
>> Fixes [YOCTO #10858]
>>
>> Signed-off-by: brian avery <brian.avery@intel.com>
>> ---
>>  meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
>> b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
>> index 6303280..13497cc 100755
>> --- a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
>> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
>> @@ -35,7 +35,7 @@ case "$1" in
>>          echo -n "Stopping $DAEMON_NAME: "
>>          count=0
>>          while [ -n "`/bin/pidof $DAEMON_PATH`" -a $count -lt 10 ] ; do
>> -            killproc $DAEMON_PATH >& /dev/null
>> +            kill -USR2 `pidofproc $DAEMON_PATH`  >& /dev/null
>>              sleep 1
>>              RETVAL=$?
>>              if [ $RETVAL != 0 -o -n "`/bin/pidof $DAEMON_PATH`" ] ; then
>> @@ -72,4 +72,3 @@ case "$1" in
>>  esac
>>
>>  exit $RETVAL
>> -
>>
>> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c03beee6996c7054f048429
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Agreed.=C2=A0 I didn&#39;t see his patch, when I did the f=
ix (and didn&#39;t check again when posting the fix).=C2=A0 Amusing we did =
it at the same time.=C2=A0 I&#39;m fine with either patch as the loop shoul=
dn&#39;t be triggered in general, nor do I think it would really help ...<d=
iv><br></div><div>-brian=C2=A0</div><div>an intel employee=C2=A0</div></div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, May 1, 2=
017 at 4:15 PM, Martin Kelly <span dir=3D"ltr">&lt;<a href=3D"mailto:mkelly=
@xevo.com" target=3D"_blank">mkelly@xevo.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Looks like this is addressing the same problem as=
 Jan&#39;s patch from earlier today. I think the differences are:<br>
<br>
- kill vs start-stop-daemon<br>
<br>
- Jan removed the retry loop while this patch does not<div class=3D"HOEnZb"=
><div class=3D"h5"><br>
<br>
On 05/01/2017 02:59 PM, brian avery wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The current initscript was lacking a -USR2 signal in the stop section.<br>
This resulted in /etc/init.d/tcf-agent stop; taking roughly 10 seconds<br>
then failing to kill the tcf-agent process. This patch brings us in line<br=
>
with how upstream stops the agent.<br>
<br>
Fixes [YOCTO #10858]<br>
<br>
Signed-off-by: brian avery &lt;<a href=3D"mailto:brian.avery@intel.com" tar=
get=3D"_blank">brian.avery@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/tcf-age<wbr>nt/tcf-agent/tcf-agent.init | 3 +--=
<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/tcf-ag<wbr>ent/tcf-agent/tcf-agent.init =
b/meta/recipes-devtools/tcf-ag<wbr>ent/tcf-agent/tcf-agent.init<br>
index 6303280..13497cc 100755<br>
--- a/meta/recipes-devtools/tcf-ag<wbr>ent/tcf-agent/tcf-agent.init<br>
+++ b/meta/recipes-devtools/tcf-ag<wbr>ent/tcf-agent/tcf-agent.init<br>
@@ -35,7 +35,7 @@ case &quot;$1&quot; in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n &quot;Stopping $DAEMON_NAME: &quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0count=3D0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while [ -n &quot;`/bin/pidof $DAEMON_PATH=
`&quot; -a $count -lt 10 ] ; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 killproc $DAEMON_PATH &gt;&amp; =
/dev/null<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kill -USR2 `pidofproc $DAEMON_PA=
TH`=C2=A0 &gt;&amp; /dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sleep 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RETVAL=3D$?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $RETVAL !=3D 0 -o -n &=
quot;`/bin/pidof $DAEMON_PATH`&quot; ] ; then<br>
@@ -72,4 +72,3 @@ case &quot;$1&quot; in<br>
=C2=A0esac<br>
<br>
=C2=A0exit $RETVAL<br>
-<br>
<br>
</blockquote>
-- <br></div></div><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c03beee6996c7054f048429--
