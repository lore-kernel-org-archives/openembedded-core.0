Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4BC6011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 03:00:46 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id n10so1515055obb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 20:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=qnQ7tyROW6JhnTn+9vPlcgwskuRrTVfGkEsTSGFhjI0=;
	b=0fwLTR/+3bIpyEr1sCRCsOJcjX+ECJ6F3acpr4gHtbRM1cBhdnPS5eWouVlNEL8snf
	4ng5TdsfP+Kvw5Em70ko0VhGA9M006amXJbzD5CssjPZXdPt8MYWgbxhWZpZ0yGVC/tV
	jRfMyP3b5IAdD2JJaZQR5HxYb5vDRSU62NXuJQGA+m37BYGhlLpJjHdIltSifwKzR1Fr
	IXB43VYLXVLrzajcYOhZRoCLEYaaDZ3NLB0kWJlOYf0SYu5OTQlYEH0pFGXq42WU//9C
	CeEumGpw4aHM3mkU9GIIpCBFQdY7pqudDYtEqwY5do/y2dS2ftjBeCfFbqkXbnmGP8nB
	EU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=qnQ7tyROW6JhnTn+9vPlcgwskuRrTVfGkEsTSGFhjI0=;
	b=ZiHC41KkTOGz2Y378pd4XqbF0xYo4lAkma9BAqf/UCn/5AqfMDc1zdtYDz84UnfrA2
	UxSDzRtVwY3wLaOdcJ2Iar/8Wgy+yNq0ZhHvZ29xtiqGrCiW7iEJEV3uS1muQm3/CwLI
	S0YY9BHM6T7qkiqUpS6cdU2Jh6B/yTEai9rEFsaN+g8LBLHOCPj/G/u7mMeviJR8T/nr
	Aq3m0dTZP3vOXCwnOja55DMgOvxh7QnqRhQq1jeN9f3MVq42Wkkb5o+z7fokiiX4hPx6
	F6sHd1xTO3jQxdqbIpnOuAtt0F6uZy6ylGkF8bTwn4f6nTyxnvk+Jx0gU9SO838rSS7B
	mYXg==
X-Gm-Message-State: AOPr4FV7B6MRg1f7Obs5f+Q8O03hEpXkhSqbSuDvQJ2HAhaZulVUUd0g6CUg8IN6CGkHbaptxPZDvS6ja9EC/Q==
MIME-Version: 1.0
X-Received: by 10.60.118.73 with SMTP id kk9mr184424oeb.64.1461034847691; Mon,
	18 Apr 2016 20:00:47 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Mon, 18 Apr 2016 20:00:47 -0700 (PDT)
In-Reply-To: <e65a4e59689b4c095366e81bae3251a62e51e1e8.1461033288.git.liezhi.yang@windriver.com>
References: <cover.1461033288.git.liezhi.yang@windriver.com>
	<e65a4e59689b4c095366e81bae3251a62e51e1e8.1461033288.git.liezhi.yang@windriver.com>
Date: Mon, 18 Apr 2016 23:00:47 -0400
Message-ID: <CADkTA4Npd7C8ekZV2S787YYqskMDhu1Fr4B_nZT7Xi89eDYHiA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] create-pull-request: create branch on remote if not found
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
X-List-Received-Date: Tue, 19 Apr 2016 03:00:48 -0000
Content-Type: multipart/alternative; boundary=047d7b41cbcc19ef7f0530cdafa1

--047d7b41cbcc19ef7f0530cdafa1
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 18, 2016 at 10:45 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Before this patch, we need two steps to create PULL:
> * Step 1, create branch:
>   $ git push <contrib> <local_branch>:<remote_branch>
> * Step 2, create PULL:
>   $ create-pull-request -u <contrib> -l <local_branch> -b <remote_branch>
> -r <local_branch>~<n>
>
> We can see that the args used in step 1 are in step 2, so we can use
> create-pull-request to create the branch if not found to simplify the
> steps.
>

I think this needs to be optional. When I'm running this script, I'm just
looking to have something
I've already pushed locally dumped. If I mess up, and don't have the branch
that I've used
pushed to my remote already (or for  whatever reason want/need different
branches .. which
was broken in previous updates to the script .. grrr),  I don't want
something pushing a branch
without be explicitly giving permission for that to happen.

Bruce


>
> [YOCTO #9408]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  scripts/create-pull-request | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index 479ad6e..7dc9836 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -173,8 +173,8 @@ esac
>  if [ -n "$WEB_URL" ]; then
>         wget --no-check-certificate -q $WEB_URL -O /dev/null
>         if [ $? -ne 0 ]; then
> -               echo "WARNING: Branch '$BRANCH' was not found on the
> contrib git tree."
> -               echo "         Please check your remote and branch
> parameter before sending."
> +               echo "Branch '$BRANCH' not found on '$REMOTE', creating
> it..."
> +               git push $REMOTE $L_BRANCH:$BRANCH
>                 echo ""
>         fi
>  fi
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--047d7b41cbcc19ef7f0530cdafa1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 18, 2016 at 10:45 PM, Robert Yang <span dir=3D"ltr">&lt;<a =
href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Before t=
his patch, we need two steps to create PULL:<br>
* Step 1, create branch:<br>
=C2=A0 $ git push &lt;contrib&gt; &lt;local_branch&gt;:&lt;remote_branch&gt=
;<br>
* Step 2, create PULL:<br>
=C2=A0 $ create-pull-request -u &lt;contrib&gt; -l &lt;local_branch&gt; -b =
&lt;remote_branch&gt; -r &lt;local_branch&gt;~&lt;n&gt;<br>
<br>
We can see that the args used in step 1 are in step 2, so we can use<br>
create-pull-request to create the branch if not found to simplify the<br>
steps.<br></blockquote><div><br></div><div>I think this needs to be optiona=
l. When I&#39;m running this script, I&#39;m just looking to have something=
</div><div>I&#39;ve already pushed locally dumped. If I mess up, and don&#3=
9;t have the branch that I&#39;ve used</div><div>pushed to my remote alread=
y (or for =C2=A0whatever reason want/need different branches .. which</div>=
<div>was broken in previous updates to the script .. grrr), =C2=A0I don&#39=
;t want something pushing a branch</div><div>without be explicitly giving p=
ermission for that to happen.</div><div><br></div><div>Bruce</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
[YOCTO #9408]<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0scripts/create-pull-request | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/create-pull-request b/scripts/create-pull-request<br>
index 479ad6e..7dc9836 100755<br>
--- a/scripts/create-pull-request<br>
+++ b/scripts/create-pull-request<br>
@@ -173,8 +173,8 @@ esac<br>
=C2=A0if [ -n &quot;$WEB_URL&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wget --no-check-certificate -q $WEB_URL -O /dev=
/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;WARNING:=
 Branch &#39;$BRANCH&#39; was not found on the contrib git tree.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Please check your remote and branch parameter be=
fore sending.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Branch &=
#39;$BRANCH&#39; not found on &#39;$REMOTE&#39;, creating it...&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git push $REMOTE $L=
_BRANCH:$BRANCH<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0fi<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--047d7b41cbcc19ef7f0530cdafa1--
