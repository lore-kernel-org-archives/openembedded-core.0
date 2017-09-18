Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id AB2D678245
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 21:11:23 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id e71so251030wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 14:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HESAd3qHKU2PPVLqWlTPSTwnGYO4CpWV8wFy1+WwqE4=;
	b=IMA7IGECt8HqHcuT0XL7dIpRqULH1Q2Z5Sd7v46rIXG5Rlu7/MtM5BaWHJURCLiAHH
	qDcE09we8qhirRVynvkHObNmh90/rf2/NyegXv/dTWbBRcb+3aB6F00Pe2nGKVAXBGS7
	OQCxWRJNfObzCHRFkW9FpxcLtA2umuK46soekBO9xw5yKcxmJeAMmHmeL7q+GY6o5EFF
	qIrwsFarOYbUTWkCZdf09mYXMID2ZJApHeNrkPBCxeEdSnTQM2RXwwuw4q8CYgL+E2Dz
	P6nImGV184NfP3yLCsv/4LD7vgbIHI6EHmOMtEsinzBQ8reL6QUKQlibO86yJrTeCl7I
	ez6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HESAd3qHKU2PPVLqWlTPSTwnGYO4CpWV8wFy1+WwqE4=;
	b=cx1FZkwT07b+Vy8qrpkoNlWQBH0Yp08w/mTngna0rti3DsbKAKZwoI9ncamVlrApbN
	aeO3yIu/ERwIdSorMp7QHGrAWtVQI2UGxxWomHc9at70Wer4b7JVaC/eZy3n+Z17k4NZ
	sQRkQmDAzfMuIqJ54kn/6dRJ0uxClk26ndZ6jz70XKczm80AVBftq0mC3J7lgKrmyhOp
	0fQSW4MP7JNum58Yfag5JgAFjO6Z4D4udrjkp1V+Z33lBuYb72614Pc1ukeLee7vCCk2
	zTqyTzhxihJWIpylUkSONhk3dpjWL5deDxiR/L3zKgOK/22jUsY3Jx70QqpCQWg/+iqg
	/Y1w==
X-Gm-Message-State: AHPjjUhliM59jKUWgZcWZm2Stato/Rq49lqyIAg2JyvccnZUYiBHhcJO
	6cpnsRNCEieq9XVmpcpkvqWiWfaA3gZ5e8tTDgI=
X-Google-Smtp-Source: AOwi7QCp4G7TXLCnj6Eoav/pcQ2OWyHgt4HJjR4hyBicCCD33eQeySyv6f6LrDNWKK2mGIn2fCBXHRfHSFEqKSfLT9I=
X-Received: by 10.28.19.10 with SMTP id 10mr5896972wmt.87.1505769084342; Mon,
	18 Sep 2017 14:11:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Mon, 18 Sep 2017 14:11:23 -0700 (PDT)
In-Reply-To: <CAJTo0LbOtfMY7mo5ASNZY0g3yd8+cwLEoWyMc4HifHH_nnyrjw@mail.gmail.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
	<CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
	<CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
	<CAJ86T=X5xAtSL4bK9tGLxrdxqtNh6ewG0n8rLfeiewL=cWA6xA@mail.gmail.com>
	<CAJTo0Lag_GCyfHCcEnNbfLOXSB+qyDhQHxUkdTF5RacgfxQEWg@mail.gmail.com>
	<CAJ86T=XFBTNtAg2_xPEFGTiH2Y_gZnRS_LZWkBWL2kPiUYARpA@mail.gmail.com>
	<CAJTo0LbOtfMY7mo5ASNZY0g3yd8+cwLEoWyMc4HifHH_nnyrjw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Sep 2017 14:11:23 -0700
Message-ID: <CAJ86T=XiebPX6z1zPReWd1cZ3U1Hz_rEZ6_8w=oLfZPFv1K5EQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Mon, 18 Sep 2017 21:11:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 18, 2017 at 1:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> > There's a call to ioctl with TIOCSWINSZ which I'm
>> > *guessing* is set window size.  Google is not useful for this!  It does
>> > all this on stderr.
>> >
>> > So yes it *should* work, but not if you redirect stderr to /dev/null.
>>
>> We don't redirect stderr to /dev/null, only stdout.
>
> One of the many patches here does.
>
> I'm holding off applying any of them right now. :)

The "get rid of resize" patch seems to have made it into mut.

