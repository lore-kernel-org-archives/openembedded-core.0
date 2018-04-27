Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id DC7066FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 18:46:15 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 186-v6so3000054itu.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 11:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mluVQvJPNZiaxu+rgtmizrLmcQ2u9MBZRapCiD2jCHk=;
	b=XKVY9VTWMxCadV6DgW1ko1nwr3GqLDp9LXJwPW+agIijic78qUUAvHh9aFEqyzMho3
	K3VU/eGMgr3jAVGn2GuQblPOkWl0d6DdDf5pPTO9w1QBDoe2Ri5vOAgBnNrqdmWOE513
	JF5fSslAC7bDGTZvYJulF6P/7pdHiaVQjmPuX+q/YMpJmVX+Z/Bo/tmeTh6DvanP3V6m
	icnslwuTJKTY31KcICRyqwyAyLORvYRAN6Dj+9mit2w0wiihiNSNNZEnl4b80OMjJttv
	RQkbyQHuaxE8wZtDzBxkMziz/j665UkvjAiwkJs8tfTz9eEayWDUfmPJZs5RrRCG6zn5
	03qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mluVQvJPNZiaxu+rgtmizrLmcQ2u9MBZRapCiD2jCHk=;
	b=pYZH1Knm7cePiJIyv8ddT9ZLq3phmQHEjuF3tMJZqyFYUR3v4bpdCSbbA6a8BnaRjt
	PYziA4QVC6ZtXnyL3CM8JFIfjYUIlTFEPChWCYXa93MitfqMLdrL0LKtQY3L0lryblRA
	dq4aTNfi2nk896gIxSO/8w34RTvEF7KXtjNPireV1PtotRnTP2u+zR7KIvw+PUfYWf9o
	Yky9FsNqUtYF78T0CtmVscJ11Wloqnqmc9UK7gOZDBazDDXLuhh5VcBFzpdqKQlQpjJM
	qqYYPm05P6HWchBDNBw9P6UZhoZsc6x+rRbii2vRmqDUb1dhzUCogbtW4lSeo8/ocpgC
	9nhA==
X-Gm-Message-State: ALQs6tDVCAmSfY7bcIdHBpwUO3yt7Yu66JeSkBpeZS3u7JWONwFSG5nL
	A5lgzRhnIg2XzJuGvPUrvpfwKd0mPIXfAPVS4FZUcQ==
X-Google-Smtp-Source: AB8JxZp95sL5aitwyNZqsF1CMk5rZ19rWOQ9vwakvzGlG5voEJAFPO055bVIo4OtXTvTx64Js5E73ltoKwiYCxHnGxU=
X-Received: by 2002:a24:a00a:: with SMTP id
	o10-v6mr3215559ite.34.1524854776478; 
	Fri, 27 Apr 2018 11:46:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Fri, 27 Apr 2018 11:45:56 -0700 (PDT)
In-Reply-To: <47f5c35c2f064ba6aa1010d79d48fa23@XBOX02.axis.com>
References: <20180425135818.23345-1-ross.burton@intel.com>
	<CAJTo0LZ234RVEsXyUooFAzoGx+WxyxipSMMfxGqVcev5xBYjuw@mail.gmail.com>
	<47f5c35c2f064ba6aa1010d79d48fa23@XBOX02.axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Apr 2018 19:45:56 +0100
Message-ID: <CAJTo0LbLqVawEagH__cHRXf0LazcH6PozsNYPaiHM3-rHnFT8A@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base: improve do_unpack[cleandirs] logic
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
X-List-Received-Date: Fri, 27 Apr 2018 18:46:16 -0000
Content-Type: text/plain; charset="UTF-8"

I thought I sent a V2 using normpath() which works a lot better.
Looks like I forgot...

On 27 April 2018 at 17:34, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Burton, Ross
>> Sent: den 26 april 2018 12:46
>> To: OE-core <openembedded-core@lists.openembedded.org>
>> Subject: Re: [OE-core] [PATCH] base: improve do_unpack[cleandirs] logic
>>
>> Retracting this, doesn't work on a clean build dir.
>>
>> Ross
>>
>> On 25 April 2018 at 14:58, Ross Burton <ross.burton@intel.com> wrote:
>> > If a recipe sets S to ${WORKDIR}/ then the S != WORKDIR test doesn't
>> work as
>> > expected.  Use os.path.samefile() instead of string comparisons to do
>> the right
>> > thing.
>> >
>> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>> > ---
>> >  meta/classes/base.bbclass | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> > index bb1f4b75336..7ddf70414a1 100644
>> > --- a/meta/classes/base.bbclass
>> > +++ b/meta/classes/base.bbclass
>> > @@ -152,7 +152,7 @@ python base_do_fetch() {
>> >  addtask unpack after do_fetch
>> >  do_unpack[dirs] = "${WORKDIR}"
>> >
>> > -do_unpack[cleandirs] = "${@d.getVar('S') if d.getVar('S') != d.getVar('WORKDIR') else os.path.join('${S}', 'patches')}"
>
> This should work even if the paths don't exist:
>
> do_unpack[cleandirs] = "${@d.getVar('S') if os.path.realpath(d.getVar('S')) != os.path.realpath(d.getVar('WORKDIR')) else os.path.join('${S}', 'patches')}"
>
>> > +do_unpack[cleandirs] = "${@os.path.join('${S}', 'patches') if os.path.samefile(d.getVar('S'), d.getVar('WORKDIR')) else d.getVar('S')}"
>> >
>> >  python base_do_unpack() {
>> >      src_uri = (d.getVar('SRC_URI') or "").split()
>> > --
>> > 2.11.0
>
> //Peter
>

