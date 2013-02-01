Received: from mail-la0-f46.google.com ([209.85.215.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1U1MDc-0006Eu-U1
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 20:24:13 +0100
Received: by mail-la0-f46.google.com with SMTP id fq12so3104961lab.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 11:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=dBpMgyyBbPAGyzYld2b2z8ZrnLECWWR2tE6jORSihXw=;
	b=TQtKVlKfnQy/tCh7afBYg1hQfIxtINQBlZDnOrtygcdBDnmFdIFGmjefA2RqPSI97q
	J4eGget4HIAuSqwKdPGGOazaVuemfrE0Ffxu88R21DlrSTMjEP0P/fX/n0y8WXTpOfRC
	9a2eUIBxkeh8VhdaKrgX3BXo1kE+3enT0Z/p9wucKSQZ1nUWDVv2A/FpIjp+kbp2ih4y
	9wupqT0r0gC87scrXqb2xR5ZIZyuIdCN1ShGwkMo9KND75/GZAeKVWzc4ZyM01x8Riq7
	hg+NbCK0kQsnr/HOBna0jBtBBlRp9nQl35EFeZsZ+O//neIIEjB3IyuNC3o56z2e/GEe
	8igA==
MIME-Version: 1.0
X-Received: by 10.112.40.137 with SMTP id x9mr5134024lbk.71.1359745708160;
	Fri, 01 Feb 2013 11:08:28 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Fri, 1 Feb 2013 11:08:28 -0800 (PST)
In-Reply-To: <510C0FF1.2010400@linux.intel.com>
References: <cover.1359708915.git.Qi.Chen@windriver.com>
	<b2319aaf09ba1dccdcd58cf067a1b0b1dd4ada93.1359708915.git.Qi.Chen@windriver.com>
	<CADkTA4Nc_fZbBTRbTi8ZbCZAa24_8r_qS9bCfXuoktisC4pavg@mail.gmail.com>
	<510C0FF1.2010400@linux.intel.com>
Date: Fri, 1 Feb 2013 14:08:28 -0500
Message-ID: <CADkTA4OuDqRE25oNRbFJCyrWpkkj62HpHHNN4qOFocNnrgSY_w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: add config fragments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 19:24:14 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe29c8eb779e04d4ae77b4

--e0cb4efe29c8eb779e04d4ae77b4
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 1, 2013 at 1:56 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 02/01/2013 06:18 AM, Bruce Ashfield wrote:
>
>>
>>
>>
>> On Fri, Feb 1, 2013 at 4:00 AM, <Qi.Chen@windriver.com
>> <mailto:Qi.Chen@windriver.com>**> wrote:
>>
>>     From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>**
>> >
>>
>>
>>     Add config fragments to busybox.
>>
>>     Both the implementation and the use case are similar to yocto kernel's
>>     configuration fragments.
>>
>>
>> I can fairly easily tweak the configuration parts of the kern-tools to
>> handle this
>> use case as well. That would allow us to re-use the kernel's
>> merge_config.sh
>> script (with a minor dependency change) and save some duplicated code. It
>> also gets you the advantage that you can consolidate configuration
>> fragments
>> outside of any build system, which isn't as critical here, but something
>> that
>> is used quite a bit during kernel testing.
>>
>>  Bruce,
>
> Where is the merge_config.sh script today?  Would you propose moving it to
> the scripts dir and have the busybox recipe call it?
>

It's part of the mainline kernel, hence why grabbing the guts out of it
reproducing
it here isn't the best idea, we'll have a need to keep them in sync. In
fact, I have
2 or 3 pending patches for it in the kern-tools repository that I need to
get upstream
(as an example).

I'd propose either creating a separate recipe for it (i.e. like
kconfig-frontends) or I could
keep it in kern-tools (badly named, but we can work on that ;) and maintain
/ coordinate
changes to it.

I just don't want to see the effort happen twice, we are busy enough!


>
> What would be your timing on making such a change, ie hold this patch
> until your get it merge or merge this and then fix it when you merge your
> changes?
>

I could feasibly get it done in the next few weeks, the changes aren't bug,
I just
have to avoid regressions on either side (kernel or busy box).

That being said, the interface to the SRC_URI is the same for the two, so
if we are
ok with me arriving and removing the in-recipe support, I guess I can't
object too
much :) The only risk is that if anyone starts using this first support
immediately,
I do risk regressing their use case, where if it never goes in, that won't
happen.

Cheers,

Bruce




>
> Sau!
>
>  To be clear, I'm not talking about the entire kern-tools here, just the
>> config parts.
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>     [YOCTO #3379]
>>
>>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>>     <mailto:Qi.Chen@windriver.com>**>
>>
>>     ---
>>       meta/recipes-core/busybox/**busybox.inc |   45
>>     ++++++++++++++++++++++++++++++**+++
>>       1 file changed, 45 insertions(+)
>>
>>     diff --git a/meta/recipes-core/busybox/**busybox.inc
>>     b/meta/recipes-core/busybox/**busybox.inc
>>     index 972e7d0..66044f8 100644
>>     --- a/meta/recipes-core/busybox/**busybox.inc
>>     +++ b/meta/recipes-core/busybox/**busybox.inc
>>     @@ -112,8 +112,53 @@ do_prepare_config () {
>>              fi
>>       }
>>
>>     +# returns all the elements from the src uri that are .cfg files
>>     +def find_cfgs(d):
>>     +    sources=src_patches(d, True)
>>     +    sources_list=[]
>>     +    for s in sources:
>>     +        if s.endswith('.cfg'):
>>     +            sources_list.append(s)
>>     +
>>     +    return sources_list
>>     +
>>     +# Merge config fragments
>>     +# All config fragments for busybox should end with .cfg
>>     +do_merge_config() {
>>     +        SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]***\)[=
>>     ].*/\2/p"
>>     +        MERGE_LIST="${@" ".join(find_cfgs(d))}"
>>     +        if [ -n "$MERGE_LIST" ]; then
>>     +                # Make a temp file, merge .config and .cfg files
>>     into it
>>     +                TMP_FILE=`mktemp .tmp.config.XXXXXXXX`
>>     +                cp .config $TMP_FILE
>>     +                for MERGE_FILE in $MERGE_LIST; do
>>     +                        CFG_LIST=`sed -n "${SED_CONFIG_EXP}"
>>     $MERGE_FILE`
>>     +                        for CFG in $CFG_LIST ; do
>>     +                                grep -q -w $CFG $TMP_FILE
>>     +                                if [ $? -eq 0 ] ; then
>>     +                                        PREV_VAL=`grep -w $CFG
>>     $TMP_FILE`
>>     +                                        NEW_VAL=`grep -w $CFG
>>     $MERGE_FILE`
>>     +                                        if [ "x$PREV_VAL" !=
>>     "x$NEW_VAL" ] ; then
>>     +                                                echo Value of $CFG
>>     is redefined by fragment $MERGE_FILE:
>>     +                                                echo Previous
>>       value: $PREV_VAL
>>     +                                                echo New value:
>>        $NEW_VAL
>>     +                                                echo
>>     +                                        fi
>>     +                                        sed -i "/$CFG[ =]/d"
>> $TMP_FILE
>>     +                                fi
>>     +                        done
>>     +                        echo >> $TMP_FILE
>>     +                        cat $MERGE_FILE >> $TMP_FILE
>>     +                done
>>     +                # Copy the temp file to .config, do some cleanup
>>     +               cp $TMP_FILE .config
>>     +               rm $TMP_FILE
>>     +        fi
>>     +}
>>     +
>>       do_configure () {
>>              do_prepare_config
>>     +       do_merge_config
>>              cml1_do_configure
>>       }
>>
>>     --
>>     1.7.9.5
>>
>>
>>     ______________________________**_________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
>>     <mailto:Openembedded-core@**lists.openembedded.org<Openembedded-core@lists.openembedded.org>
>> >
>>
>>     http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>> openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>>
>> ______________________________**_________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>>
>>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e0cb4efe29c8eb779e04d4ae77b4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, Feb 1, 2013 at 1:56 PM, Saul Wold <span dir=3D"ltr">&lt;<a =
href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</=
a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 02/01/2013 06:18 AM, Br=
uce Ashfield wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"im">
<br>
<br>
<br>
On Fri, Feb 1, 2013 at 4:00 AM, &lt;<a href=3D"mailto:Qi.Chen@windriver.com=
" target=3D"_blank">Qi.Chen@windriver.com</a><br></div>
&lt;mailto:<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Ch=
en@windriver.com</a>&gt;<u></u>&gt; wrote:<br>
<br>
=A0 =A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a> &lt;mailto:<a href=3D"mailto:Qi.Chen@=
windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<u></u>&gt;<d=
iv class=3D"im">
<br>
<br>
=A0 =A0 Add config fragments to busybox.<br>
<br>
=A0 =A0 Both the implementation and the use case are similar to yocto kerne=
l&#39;s<br>
=A0 =A0 configuration fragments.<br>
<br>
<br>
I can fairly easily tweak the configuration parts of the kern-tools to<br>
handle this<br>
use case as well. That would allow us to re-use the kernel&#39;s merge_conf=
ig.sh<br>
script (with a minor dependency change) and save some duplicated code. It<b=
r>
also gets you the advantage that you can consolidate configuration fragment=
s<br>
outside of any build system, which isn&#39;t as critical here, but somethin=
g<br>
that<br>
is used quite a bit during kernel testing.<br>
<br>
</div></blockquote>
Bruce,<br>
<br>
Where is the merge_config.sh script today? =A0Would you propose moving it t=
o the scripts dir and have the busybox recipe call it?<br></blockquote><div=
><br></div><div style>It&#39;s part of the mainline kernel, hence why grabb=
ing the guts out of it reproducing=A0</div>
<div style>it here isn&#39;t the best idea, we&#39;ll have a need to keep t=
hem in sync. In fact, I have</div><div style>2 or 3 pending patches for it =
in the kern-tools repository that I need to get upstream</div><div style>
(as an example).</div><div style><br></div><div style>I&#39;d propose eithe=
r creating a separate recipe for it (i.e. like kconfig-frontends) or I coul=
d</div><div style>keep it in kern-tools (badly named, but we can work on th=
at ;) and maintain / coordinate</div>
<div style>changes to it.</div><div style><br></div><div style>I just don&#=
39;t want to see the effort happen twice, we are busy enough!</div><div>=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">

<br>
What would be your timing on making such a change, ie hold this patch until=
 your get it merge or merge this and then fix it when you merge your change=
s?<br></blockquote><div><br></div><div style>I could feasibly get it done i=
n the next few weeks, the changes aren&#39;t bug, I just</div>
<div style>have to avoid regressions on either side (kernel or busy box).=
=A0</div><div style><br></div><div style>That being said, the interface to =
the SRC_URI is the same for the two, so if we are</div><div style>ok with m=
e arriving and removing the in-recipe support, I guess I can&#39;t object t=
oo</div>
<div style>much :) The only risk is that if anyone starts using this first =
support immediately,=A0</div><div style>I do risk regressing their use case=
, where if it never goes in, that won&#39;t happen.</div><div style><br></d=
iv>
<div style>Cheers,</div><div style><br></div><div style>Bruce</div><div sty=
le><br></div><div style><br></div><div>=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">

<br>
Sau!<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">
To be clear, I&#39;m not talking about the entire kern-tools here, just the=
<br>
config parts.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
<br>
=A0 =A0 [YOCTO #3379]<br>
<br>
=A0 =A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a><br></div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blan=
k">Qi.Chen@windriver.com</a>&gt;<u></u>&gt;<div><div class=3D"h5"><br>
=A0 =A0 ---<br>
=A0 =A0 =A0 meta/recipes-core/busybox/<u></u>busybox.inc | =A0 45<br>
=A0 =A0 ++++++++++++++++++++++++++++++<u></u>+++<br>
=A0 =A0 =A0 1 file changed, 45 insertions(+)<br>
<br>
=A0 =A0 diff --git a/meta/recipes-core/busybox/<u></u>busybox.inc<br>
=A0 =A0 b/meta/recipes-core/busybox/<u></u>busybox.inc<br>
=A0 =A0 index 972e7d0..66044f8 100644<br>
=A0 =A0 --- a/meta/recipes-core/busybox/<u></u>busybox.inc<br>
=A0 =A0 +++ b/meta/recipes-core/busybox/<u></u>busybox.inc<br>
=A0 =A0 @@ -112,8 +112,53 @@ do_prepare_config () {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0fi<br>
=A0 =A0 =A0 }<br>
<br>
=A0 =A0 +# returns all the elements from the src uri that are .cfg files<br=
>
=A0 =A0 +def find_cfgs(d):<br>
=A0 =A0 + =A0 =A0sources=3Dsrc_patches(d, True)<br>
=A0 =A0 + =A0 =A0sources_list=3D[]<br>
=A0 =A0 + =A0 =A0for s in sources:<br>
=A0 =A0 + =A0 =A0 =A0 =A0if s.endswith(&#39;.cfg&#39;):<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0sources_list.append(s)<br>
=A0 =A0 +<br>
=A0 =A0 + =A0 =A0return sources_list<br>
=A0 =A0 +<br>
=A0 =A0 +# Merge config fragments<br>
=A0 =A0 +# All config fragments for busybox should end with .cfg<br>
=A0 =A0 +do_merge_config() {<br>
=A0 =A0 + =A0 =A0 =A0 =A0SED_CONFIG_EXP=3D&quot;s/^\(# \)\{0,1\}\(CONFIG_[a=
-zA-Z0-9_]<u></u>*\)[=3D<br>
=A0 =A0 ].*/\2/p&quot;<br>
=A0 =A0 + =A0 =A0 =A0 =A0MERGE_LIST=3D&quot;${@&quot; &quot;.join(find_cfgs=
(d))}&quot;<br>
=A0 =A0 + =A0 =A0 =A0 =A0if [ -n &quot;$MERGE_LIST&quot; ]; then<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# Make a temp file, merge .config =
and .cfg files<br>
=A0 =A0 into it<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0TMP_FILE=3D`mktemp .tmp.config.XXX=
XXXXX`<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cp .config $TMP_FILE<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for MERGE_FILE in $MERGE_LIST; do<=
br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CFG_LIST=3D`sed -n=
 &quot;${SED_CONFIG_EXP}&quot;<br>
=A0 =A0 $MERGE_FILE`<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for CFG in $CFG_LI=
ST ; do<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gr=
ep -q -w $CFG $TMP_FILE<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if=
 [ $? -eq 0 ] ; then<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0PREV_VAL=3D`grep -w $CFG<br>
=A0 =A0 $TMP_FILE`<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0NEW_VAL=3D`grep -w $CFG<br>
=A0 =A0 $MERGE_FILE`<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0if [ &quot;x$PREV_VAL&quot; !=3D<br>
=A0 =A0 &quot;x$NEW_VAL&quot; ] ; then<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo Value of $CFG<br>
=A0 =A0 is redefined by fragment $MERGE_FILE:<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo Previous<br>
=A0 =A0 =A0 value: $PREV_VAL<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo New value:<br>
=A0 =A0 =A0 =A0$NEW_VAL<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0fi<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0sed -i &quot;/$CFG[ =3D]/d&quot; $TMP_FILE<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi=
<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0done<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo &gt;&gt; $TMP=
_FILE<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cat $MERGE_FILE &g=
t;&gt; $TMP_FILE<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0done<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# Copy the temp file to .config, d=
o some cleanup<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp $TMP_FILE .config<br>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm $TMP_FILE<br>
=A0 =A0 + =A0 =A0 =A0 =A0fi<br>
=A0 =A0 +}<br>
=A0 =A0 +<br>
=A0 =A0 =A0 do_configure () {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0do_prepare_config<br>
=A0 =A0 + =A0 =A0 =A0 do_merge_config<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0cml1_do_configure<br>
=A0 =A0 =A0 }<br>
<br>
=A0 =A0 --<br>
=A0 =A0 1.7.9.5<br>
<br>
<br>
=A0 =A0 ______________________________<u></u>_________________<br>
=A0 =A0 Openembedded-core mailing list<br>
=A0 =A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.<u></u>openembedded.org</a><br></div></=
div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembedded.o=
rg" target=3D"_blank">Openembedded-core@<u></u>lists.openembedded.org</a>&g=
t;<div class=3D"im"><br>
=A0 =A0 <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/open=
embedded-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/=
mailman/listinfo/<u></u>openembedded-core</a><br>
<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
<br>
</div></blockquote>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;
</div></div>

--e0cb4efe29c8eb779e04d4ae77b4--
