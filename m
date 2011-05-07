Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIlni-0004ED-Ja
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 20:00:23 +0200
Received: by eye27 with SMTP id 27so1243935eye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=T8I6sGwcOWhkLeJtDA/advspyZ1uFC+gaSWuueLUPYI=;
	b=MiONkWj6JxnzpF8KHR3Jxq1g/diYn377k7ku8zD8G98GqnzWhzgRIPOMACaHCT7y60
	UFgPwN7657anfq6SY3d9qxLk8TjSXFTrIR3hvKHg2pYAyzufvejTCSbd3VgtlDi8CdAp
	EpPM5p3NGSJPZUX+sQJGqE4GgsqghBGY2xbl4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=LKhdrFfBV/YBFlW5yAvHWyZI7fKOlqgmF23YB+w6GxwLIJdKNX63eB2moKD9Q+NicH
	B3FoCyMGEZHsrNHfwrBrJ2MujXeGkjYu0Lwl6i4+JE07tOB9UKeczPGuV4Bz7Z+b410f
	CvYLLI4kLsLLIb6tzKAhrpuGJBPCFIDjDtcN0=
Received: by 10.14.8.210 with SMTP id 58mr2495922eer.112.1304791060198; Sat,
	07 May 2011 10:57:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Sat, 7 May 2011 10:57:09 -0700 (PDT)
In-Reply-To: <1304785415.8085.6.camel@doubt>
References: <cover.1304754527.git.raj.khem@gmail.com>
	<0a674cfa8f7de53b7b75c0213a483aad0276986f.1304754527.git.raj.khem@gmail.com>
	<1304785415.8085.6.camel@doubt>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 May 2011 10:57:09 -0700
Message-ID: <BANLkTin+ix9F=SpnuWgvn3uYyOtQ1SUEOQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] scripts/send-pull-request: Add CC selectively
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 May 2011 18:00:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 7, 2011 at 9:23 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> On Sat, 2011-05-07 at 00:54 -0700, Khem Raj wrote:
>> Currently a consolidated pull request adds all the participants
>> to every patch, which in essence is good but might lose focus
>> of developers who would be interested to know about the patch
>> that developer contributed to. This patch fixes the script by
>> extracting the to and cc information from each patch one by one
>> and add it to patch mail header instead of doing a sweeping one
>> pass over all patches to collect all email addresses. It should
>> reduce some email traffic for developers.
>
> This behavior was intentional. If you don't want the CC applied to the
> entire series, you can just use git-send-email as this is its behavior.

imho git request-pull would have been sufficient for us along with git
send-mail to post all patches for review
and get acks and sign-offs then the they all can be collected using
patchwork or whatever way one likes and
then git pull-request can be sent

Right now one one sends a pull requests and publishes the tree for
pull then feedback is given and one does another round and
repulishes the tree. So having all patches sent for review using git
send-mail and then form pull-requests once they are approved
would be a way to go


> In particular, it doesn't apply any of the addresses from the patches to
> the cover letter, which was my primary objection.

yes once I did this I was sort of thinking that it would be
appropriate to CC all concerned on cover letter
Should be doable.

>
> If you would like to modify this patch to apply the entire CC list to
> the cover letter, then I think you'll have addressed both of our
> concerns and I'll add my Acked-by. As it is, please do not accept this
> patch. I will nack it for poky and we don't want the two to diverge.
>
> Please include the primary author/maintainer of sources/recipes/etc. on
> CC.

I guess this should be automated somehow too.

>
> Thanks,
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0scripts/send-pull-request | =C2=A0 51 +++++++++++++++++++++++++---=
----------------
>> =C2=A01 files changed, 29 insertions(+), 22 deletions(-)
>>
>> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
>> index 3af2a9f..36a89f4 100755
>> --- a/scripts/send-pull-request
>> +++ b/scripts/send-pull-request
>> @@ -29,24 +29,38 @@ EOM
>> =C2=A0# Collect To and CC addresses from the patch files if they exist
>> =C2=A0# $1: Which header to add the recipients to, "TO" or "CC"
>> =C2=A0# $2: The regex to match and strip from the line with email addres=
ses
>> +# $3: The patch which we are preparing to send
>> =C2=A0harvest_recipients()
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0TO_CC=3D$1
>> =C2=A0 =C2=A0 =C2=A0REGX=3D$2
>> + =C2=A0 =C2=A0PATCH=3D$3
>> =C2=A0 =C2=A0 =C2=A0export IFS=3D$',\n'
>> - =C2=A0 =C2=A0for PATCH in $PDIR/*.patch; do
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# Grab To addresses
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0for EMAIL in $(sed '/^---$/q' $PATCH | grep=
 -e "$REGX" | sed "s/$REGX//"); do
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "$TO_CC" =3D=3D "TO" ] &=
& [ "${TO/$EMAIL/}" =3D=3D "$TO" ] && [ -n "$EMAIL" ]; then
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z "$TO" ]=
; then TO=3D$EMAIL; else TO=3D"$TO,$EMAIL"; fi
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ "$TO_CC" =3D=3D "CC" ]=
 && [ "${CC/$EMAIL/}" =3D=3D "$CC" ] && [ -n "$EMAIL" ]; then
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z "$CC" ]=
; then CC=3D$EMAIL; else CC=3D"$CC,$EMAIL"; fi
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0done
>> + =C2=A0 =C2=A0# Grab To addresses
>> + =C2=A0 =C2=A0for EMAIL in $(sed '/^---$/q' $PATCH | grep -e "$REGX" | =
sed "s/$REGX//"); do
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "$TO_CC" =3D=3D "TO" ] && [ "${TO/$EMA=
IL/}" =3D=3D "$TO" ] && [ -n "$EMAIL" ]; then
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z "$TO" ]; then TO=3D$EMAIL; =
else TO=3D"$TO,$EMAIL"; fi
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ "$TO_CC" =3D=3D "CC" ] && [ "${CC/$E=
MAIL/}" =3D=3D "$CC" ] && [ -n "$EMAIL" ]; then
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z "$CC" ]; then CC=3D$EMAIL; =
else CC=3D"$CC,$EMAIL"; fi
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>> =C2=A0 =C2=A0 =C2=A0done
>> =C2=A0 =C2=A0 =C2=A0unset IFS
>> =C2=A0}
>>
>> +# $1: The given patch
>> +create_recipient_lists()
>> +{
>> + =C2=A0 =C2=A0THEPATCH=3D$1
>> + =C2=A0 =C2=A0# Harvest emails from the generated patch and populate th=
e TO and CC variables
>> + =C2=A0 =C2=A0# In addition to To and CC headers/lines, the common Sign=
ed-off-by, Tested-by,
>> + =C2=A0 =C2=A0# etc. (*-by) will be added to CC.
>> + =C2=A0 =C2=A0if [ $AUTO -eq 1 ]; then
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0harvest_recipients TO "^[Tt][Oo]: *" $THEPA=
TCH
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0harvest_recipients CC "^[Cc][Cc]: *" $THEPA=
TCH
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0harvest_recipients CC "^.*-[Bb][Yy]: *" $TH=
EPATCH
>> + =C2=A0 =C2=A0fi
>> +}
>> +
>>
>> =C2=A0# Parse and verify arguments
>> =C2=A0while getopts "af:ghp:t:" OPT; do
>> @@ -100,15 +114,6 @@ for TOKEN in SUBJECT BLURB; do
>> =C2=A0done
>>
>>
>> -# Harvest emails from the generated patches and populate the TO and CC =
variables
>> -# In addition to To and CC headers/lines, the common Signed-off-by, Tes=
ted-by,
>> -# etc. (*-by) will be added to CC.
>> -if [ $AUTO -eq 1 ]; then
>> - =C2=A0 =C2=A0harvest_recipients TO "^[Tt][Oo]: *"
>> - =C2=A0 =C2=A0harvest_recipients CC "^[Cc][Cc]: *"
>> - =C2=A0 =C2=A0harvest_recipients CC "^.*-[Bb][Yy]: *"
>> -fi
>> -
>> =C2=A0case "$PULL_MTA" in
>> =C2=A0 =C2=A0 =C2=A0git)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FROM=3D"$(git config sendemail.from)"
>> @@ -158,11 +163,12 @@ if [ "$cont" =3D=3D "y" ] || [ "$cont" =3D=3D "Y" =
]; then
>> =C2=A0 =C2=A0 =C2=A0ERROR=3D0
>> =C2=A0 =C2=A0 =C2=A0case "$PULL_MTA" in
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export IFS=3D$','
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIT_TO=3D$(for R in $TO; do e=
cho -n "--to=3D'$R' "; done)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIT_CC=3D$(for R in $CC; do e=
cho -n "--cc=3D'$R' "; done)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset IFS
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for PATCH in $PDIR/*patc=
h; do
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_recipien=
t_lists $PATCH
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export IFS=3D$'=
,'
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIT_TO=3D$(for =
R in $TO; do echo -n "--to=3D'$R' "; done)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIT_CC=3D$(for =
R in $CC; do echo -n "--cc=3D'$R' "; done)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset IFS
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We harve=
st the emails manually, so force git not to.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval "git =
send-email $GIT_TO $GIT_CC --no-chain-reply-to --suppress-cc=3Dall $PATCH"
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -e=
q 1 ]; then
>> @@ -172,6 +178,7 @@ if [ "$cont" =3D=3D "y" ] || [ "$cont" =3D=3D "Y" ];=
 then
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sendmail)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for PATCH in $PDIR/*patc=
h; do
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_recipien=
t_lists $PATCH
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Insert T=
o and CC headers via formail to keep them separate and
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# appendin=
g them to the sendmail command as -- $TO $CC has
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# proven t=
o be an exercise in futility.
>
> --
> Darren Hart
> Yocto Linux Kernel
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


