Return-Path: <net147@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id ACEBD7002B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 06:53:54 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id y2so366698150oie.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 23:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RJ/hfAe+a406aRa+WR3lmwCGjHhPUaING/LmEgKvfJE=;
	b=gWlnOp0Rpt/uRlT+iBw4OlCP1pfTSBSwujd57yT8jaGP+LcT8QEO4pSUgnytG4247m
	IrdUulxNdp/G63jqQebTBhwUxtOtxtE5wELz1erVNjvfJupQxrZNa/BZtVZJVZ6aycxi
	vnmsfbYQ1dZkwhWethQILV4TP88uqhLyAvR+d7/p9X9fjkNZ1tYx8M9GRkV8FfQiU3tv
	KEclb/SxNEJ/Jpt5obdU79+AWSFw8lMPJWnc19RvUo0pdLQKHFG3wtEJknQRZYkOaRsL
	0eVr0/gkofOWbtIRlNMbHrlcD6sRcWFgVUbzu3R8Org10+9673/OEj7NsA3Z2NhJm6gg
	ZF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RJ/hfAe+a406aRa+WR3lmwCGjHhPUaING/LmEgKvfJE=;
	b=KYQe1798fwYLDTWwmscKYySOj1crJYFb0OD0xdV4L2McjqbDNSuGqcZqz/zsQBUmeY
	3YtLNpnhlXM9gA3sHwQxDQVys2FHZA+TqxTTvUhg7/nICZqvNvi9yI34fJwgr4HQYoV+
	q2jCjTMydsx37b5JiwPYuVxxi4H86nr2MDFBVwt3mJ4CFx2CBEw3JB9HUdTO4sjNgUE7
	UP0cBa6XJirLHIQfNDKuW0BpOa0OqqZRJ2AzfIck69Q2XXqonshDSbQMxoNSkYY6239x
	Oiwulu8KZPqzhb/LgnxZuf30ZknSdo9qSoLpeZQW1kOxdRvlTvgOONtcPfQgQxJ03lpV
	qIEQ==
X-Gm-Message-State: AE9vXwORXFw4S+1nPT63F9tfVwr5ZXlzEfmMJnSKFuJjM9ee7wiJdN0d7k0Z325Uwt/eIRybs24I4hv1dP9/oQ==
X-Received: by 10.202.169.193 with SMTP id s184mr5011992oie.144.1473749635613; 
	Mon, 12 Sep 2016 23:53:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.60.73 with HTTP; Mon, 12 Sep 2016 23:53:55 -0700 (PDT)
In-Reply-To: <1473698604.7207.4.camel@linuxfoundation.org>
References: <20160911121416.31304-1-net147@gmail.com>
	<1473675573.20226.364.camel@linuxfoundation.org>
	<CANwerB1hTME1C=F+BA=xAC7Zx+mFP79EOTnw+HmUyi4Z6b6S7Q@mail.gmail.com>
	<1473698604.7207.4.camel@linuxfoundation.org>
From: Jonathan Liu <net147@gmail.com>
Date: Tue, 13 Sep 2016 16:53:55 +1000
Message-ID: <CANwerB022A5_uMQta9q4w2VV-m++GmdYB+fKWOD0W4tKO4dW9Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Do not expand variables in IMAGE_CMD vardepsexclude
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
X-List-Received-Date: Tue, 13 Sep 2016 06:53:56 -0000
Content-Type: text/plain; charset=UTF-8

Hi Richard,

On 13 September 2016 at 02:43, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2016-09-13 at 00:05 +1000, Jonathan Liu wrote:
>> Hi Richard,
>>
>> On 12 September 2016 at 20:19, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Sun, 2016-09-11 at 22:14 +1000, Jonathan Liu wrote:
>> > >
>> > > This fixes tashhash mismatch errors creating images when
>> > > IMAGE_CMD
>> > > references a variable whose value is always changing even though
>> > > the
>> > > variable is specified in IMAGE_CMD vardepsexclude.
>> > >
>> > > Signed-off-by: Jonathan Liu <net147@gmail.com>
>> > > ---
>> > >  meta/classes/image.bbclass | 4 ++++
>> > >  1 file changed, 4 insertions(+)
>> > >
>> > > diff --git a/meta/classes/image.bbclass
>> > > b/meta/classes/image.bbclass
>> > > index 8c8b8a2..f85ea86 100644
>> > > --- a/meta/classes/image.bbclass
>> > > +++ b/meta/classes/image.bbclass
>> > > @@ -441,6 +441,10 @@ python () {
>> > >          localdata.delVar('DATETIME')
>> > >          localdata.delVar('TMPDIR')
>> > >
>> > > +        vardepsexclude = d.getVarFlag('IMAGE_CMD',
>> > > 'vardepsexclude',
>> > > True) or ''
>> > > +        vardepsexclude += ' ' + (d.getVarFlag('IMAGE_CMD_' +
>> > > realt,
>> > > 'vardepsexclude', True) or '')
>> > > +        for var in vardepsexclude.split():
>> > > +            localdata.delVar(var)
>> > >          image_cmd = localdata.getVar("IMAGE_CMD", True)
>> > >          vardeps.add('IMAGE_CMD_' + realt)
>> > >          if image_cmd:
>> > I think this is complicating an already fragile situation and it
>> > worries me. Can you be more specific about which variable is
>> > causing
>> > problems here?
>> See IMAGEDATESTAMP variable in:
>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/clas
>> ses/sdcard_image-rpi.bbclass
>> https://github.com/linux-sunxi/meta-sunxi/blob/master/classes/sdcard_
>> image-sunxi.bbclass
>>
>> You can test by changing to:
>> IMAGEDATESTAMP = "${@time.clock()}"
>
> I appreciate this doesn't solve the underlying problem but is there a
> reason they can't just use ${DATE} there?

I have submitted patches to meta-raspberrypi and meta-sunxi to remove
IMAGEDATESTAMP since it is using IMAGE_NAME which already includes
date and time.

>
> I mention this since DATE/TIME are handled by bitbake specially so that
> for example if your build rolls over midnight, it doesn't explode
> badly. If your images is generated pre midnight but them processed
> afterwards, I can see things working badly for that code...
>
> Cheers,
>
> Richard

Regards,
Jonathan

