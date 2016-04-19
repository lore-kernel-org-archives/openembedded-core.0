Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id DC0666FF9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:18:41 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id x201so6714479oif.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 05:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=WVfLyExMRn2dlVXa1VPz/ESbT/okcd2QW9WjZIewBPQ=;
	b=kfijzni0CBVbxsVs+9kfy/SldbA7jQOx2aNwl058viuIgWgQTK4j3b2v93iciGidgS
	FaG1pumIio3Ul1Zd+rFbiBTcg5Bp+eLh2Vx7dZZUt89DpXiPyxE/SvzMXA4iiVnCHmaG
	IKLhhuobudlRrpsJJl5G7fdWSdRqgvNcZx5wfkQ9z60/fHi+rpTHgKUAW5vcUR1A5rm2
	5l0w8RkLXp+nObKEiTdXYEG3OLoUjCThU51su7cF9k5vP/w3wHqb6+0kFPrg8w35Odzw
	JatQv3kbV66ntnWGdhVgVrngiH+HQsXvScXXi1hddb4EGuesDKCjUxEfDU9rUtkbu/XU
	aufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=WVfLyExMRn2dlVXa1VPz/ESbT/okcd2QW9WjZIewBPQ=;
	b=HHQfnqPx5ke+9YgIC5KboO2UOC2P1eI8l41GH18IkwiQWZEqIfDaWQrk1uOK+HFo40
	GcBpUnW82l2nxeb3mmN4Rc4wVbCzIvZ+5G5oXGx0S/ExW0w7vfg6XRDWudwDcC0DYHv3
	k7kmhwgNSl3S50hX5xuzEU6Dh1QZ3uKr+RPrujBXkpQeLHo3IkLZIBjwKifNLh8MCoFZ
	KbpOhqh0s1wJ9XRNwCwNJH6ZCfPpvgv9TlPUENKu/kAXAYA7jbcJOaKq6bLHcCe4aqc0
	watGDi0u9NFsHHYUaPIywzAtBqZObzgHVOLT9s7s0YLXaxDmuD41jljtmhKs6JSo1HyB
	9Fyw==
X-Gm-Message-State: AOPr4FW/e/NqtR+hjUW2UF/WaoFvV/Bwcb64R58a/lDf1UABhhCejmDSj2hWP0st+mKYZ050AutweH1jilqHGQ==
MIME-Version: 1.0
X-Received: by 10.157.54.54 with SMTP id w51mr907444otb.186.1461068321870;
	Tue, 19 Apr 2016 05:18:41 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 19 Apr 2016 05:18:41 -0700 (PDT)
In-Reply-To: <5715A24B.9010406@windriver.com>
References: <cover.1461033288.git.liezhi.yang@windriver.com>
	<e65a4e59689b4c095366e81bae3251a62e51e1e8.1461033288.git.liezhi.yang@windriver.com>
	<CADkTA4Npd7C8ekZV2S787YYqskMDhu1Fr4B_nZT7Xi89eDYHiA@mail.gmail.com>
	<5715A24B.9010406@windriver.com>
Date: Tue, 19 Apr 2016 08:18:41 -0400
Message-ID: <CADkTA4N15+J0p5o44X-21Q43E9Srmf9+F49NNtYOTEh84mCWEA@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Apr 2016 12:18:42 -0000
Content-Type: multipart/alternative; boundary=001a114772b2515b8d0530d57ac0

--001a114772b2515b8d0530d57ac0
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 18, 2016 at 11:13 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
>
> On 04/19/2016 11:00 AM, Bruce Ashfield wrote:
>
>>
>>
>> On Mon, Apr 18, 2016 at 10:45 PM, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>     Before this patch, we need two steps to create PULL:
>>     * Step 1, create branch:
>>        $ git push <contrib> <local_branch>:<remote_branch>
>>     * Step 2, create PULL:
>>        $ create-pull-request -u <contrib> -l <local_branch> -b
>> <remote_branch>
>>     -r <local_branch>~<n>
>>
>>     We can see that the args used in step 1 are in step 2, so we can use
>>     create-pull-request to create the branch if not found to simplify the
>>     steps.
>>
>>
>> I think this needs to be optional. When I'm running this script, I'm just
>> looking to have something
>> I've already pushed locally dumped. If I mess up, and don't have the
>> branch that
>> I've used
>> pushed to my remote already (or for  whatever reason want/need different
>> branches .. which
>> was broken in previous updates to the script .. grrr),  I don't want
>> something
>> pushing a branch
>> without be explicitly giving permission for that to happen.
>>
>
> Thanks, how about add an option:
>
> "-a     automatically push/update local branch (-l) to remote branch (-b)"
>
> Then it will always create/update the remote branch when -a is used.
>

That would meet my requirement. So looks fine to me. Others of course have
the
right to object :)

Cheers,

Bruce


>
> // Robert
>
>
>> Bruce
>>
>>
>>     [YOCTO #9408]
>>
>>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>>     <mailto:liezhi.yang@windriver.com>>
>>
>>     ---
>>       scripts/create-pull-request | 4 ++--
>>       1 file changed, 2 insertions(+), 2 deletions(-)
>>
>>     diff --git a/scripts/create-pull-request b/scripts/create-pull-request
>>     index 479ad6e..7dc9836 100755
>>     --- a/scripts/create-pull-request
>>     +++ b/scripts/create-pull-request
>>     @@ -173,8 +173,8 @@ esac
>>       if [ -n "$WEB_URL" ]; then
>>              wget --no-check-certificate -q $WEB_URL -O /dev/null
>>              if [ $? -ne 0 ]; then
>>     -               echo "WARNING: Branch '$BRANCH' was not found on the
>> contrib
>>     git tree."
>>     -               echo "         Please check your remote and branch
>> parameter
>>     before sending."
>>     +               echo "Branch '$BRANCH' not found on '$REMOTE',
>> creating it..."
>>     +               git push $REMOTE $L_BRANCH:$BRANCH
>>                      echo ""
>>              fi
>>       fi
>>     --
>>     2.7.4
>>
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its
>> end"
>>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114772b2515b8d0530d57ac0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 18, 2016 at 11:13 PM, Robert Yang <span dir=3D"ltr">&lt;<a =
href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D""><br>
<br>
On 04/19/2016 11:00 AM, Bruce Ashfield wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
<br>
On Mon, Apr 18, 2016 at 10:45 PM, Robert Yang &lt;<a href=3D"mailto:liezhi.=
yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br></sp=
an><span class=3D"">
&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">l=
iezhi.yang@windriver.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Before this patch, we need two steps to create PULL:<br>
=C2=A0 =C2=A0 * Step 1, create branch:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0$ git push &lt;contrib&gt; &lt;local_branch&gt;:=
&lt;remote_branch&gt;<br>
=C2=A0 =C2=A0 * Step 2, create PULL:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0$ create-pull-request -u &lt;contrib&gt; -l &lt;=
local_branch&gt; -b &lt;remote_branch&gt;<br>
=C2=A0 =C2=A0 -r &lt;local_branch&gt;~&lt;n&gt;<br>
<br>
=C2=A0 =C2=A0 We can see that the args used in step 1 are in step 2, so we =
can use<br>
=C2=A0 =C2=A0 create-pull-request to create the branch if not found to simp=
lify the<br>
=C2=A0 =C2=A0 steps.<br>
<br>
<br>
I think this needs to be optional. When I&#39;m running this script, I&#39;=
m just<br>
looking to have something<br>
I&#39;ve already pushed locally dumped. If I mess up, and don&#39;t have th=
e branch that<br>
I&#39;ve used<br>
pushed to my remote already (or for=C2=A0 whatever reason want/need differe=
nt<br>
branches .. which<br>
was broken in previous updates to the script .. grrr),=C2=A0 I don&#39;t wa=
nt something<br>
pushing a branch<br>
without be explicitly giving permission for that to happen.<br>
</span></blockquote>
<br>
Thanks, how about add an option:<br>
<br>
&quot;-a=C2=A0 =C2=A0 =C2=A0automatically push/update local branch (-l) to =
remote branch (-b)&quot;<br>
<br>
Then it will always create/update the remote branch when -a is used.<br></b=
lockquote><div><br></div><div>That would meet my requirement. So looks fine=
 to me. Others of course have the</div><div>right to object :)</div><div><b=
r></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
// Robert<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
<br>
Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 [YOCTO #9408]<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@=
windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br></span>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" targe=
t=3D"_blank">liezhi.yang@windriver.com</a>&gt;&gt;<div><div class=3D"h5"><b=
r>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0 scripts/create-pull-request | 4 ++--<br>
=C2=A0 =C2=A0 =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0 =C2=A0 diff --git a/scripts/create-pull-request b/scripts/create-pul=
l-request<br>
=C2=A0 =C2=A0 index 479ad6e..7dc9836 100755<br>
=C2=A0 =C2=A0 --- a/scripts/create-pull-request<br>
=C2=A0 =C2=A0 +++ b/scripts/create-pull-request<br>
=C2=A0 =C2=A0 @@ -173,8 +173,8 @@ esac<br>
=C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$WEB_URL&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wget --no-check-certificate=
 -q $WEB_URL -O /dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo =
&quot;WARNING: Branch &#39;$BRANCH&#39; was not found on the contrib<br>
=C2=A0 =C2=A0 git tree.&quot;<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo =
&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Please check your remote and branch=
 parameter<br>
=C2=A0 =C2=A0 before sending.&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo =
&quot;Branch &#39;$BRANCH&#39; not found on &#39;$REMOTE&#39;, creating it.=
..&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git p=
ush $REMOTE $L_BRANCH:$BRANCH<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0echo &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 2.7.4<br>
<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 _______________________________________________<br>
=C2=A0 =C2=A0 Openembedded-core mailing list<br>
=C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br></div></di=
v>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a>&gt=
;<span class=3D""><br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/mailman/listinfo/openembedded-core</a><br>
<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its<br>
end&quot;<br>
</span></blockquote>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a114772b2515b8d0530d57ac0--
