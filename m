Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2D971B9D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 18:39:44 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id d13so115559qta.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 11:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=/YFoNHAILHgHiO0IFXgdINxH+D40yEmXKv+T/mxKynM=;
	b=g3+a8ESOxfb3e3jMnyamaP7qP52VRUq/pCNeAk6XdKKLYdYJV/YEuBqW9DMOtV/koD
	U1DNO4MU70ImrNMHtODTJNiYDFn8Ui8THXo5f4rvDeVbNlWfD4S0KfHUuWKq2F+BPnPa
	W1P4/BSv0EMQKuHRwTa6YRdAdY6uUtEVF6RMj1nKOtSBrm7H/onxXMt/MC08mPtZFYfR
	DH7zmqL52QY8dplWbn23EgNENrZhnOxksmEqlGsvuZO0chFF+vg9uqzurbm4kvsQ5+2I
	z/qdxcPtTrgEebhnEZvTkgX6NIJ8PeoWcoW0PEWi4HOufxckrhLBOkHQhuVS2m7C3gOm
	0FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=/YFoNHAILHgHiO0IFXgdINxH+D40yEmXKv+T/mxKynM=;
	b=CncNH/egbMrC6Zsa160HWzlh0wbE9yK2S9uNF2hIZ0Fe5YiCZFBQp7XkxFEO/vRs5r
	y3rjvY2wbauxWrUMF/Jfcuq23qZ64jUocZvZin3SfU6Fhv5LPImrIwGcub4PltMqU663
	nL5U9mb/GO333okOhCYAtg1+hnU8pI1IQ+RpzqBjQcexc4hGh+Us47ukGlcaHJvXpnvw
	+redExsGIYpk0S+jjmDfkOPJAc1BoF0klisMmbmiRtO8GziAYVkXqFK/krCV+JYp4Pu5
	gIGXBFJ/fGXVD3VFRwSjsrWg4ep3SHgvRx8KjiE5kIIcIsyC/dmJi6em5x9y4Wq+XmzX
	zMaQ==
X-Gm-Message-State: AHPjjUhAnAuc7gNcY2WutOoYAlojz1AMpavRA4dDMnJkdQLFl9IynB0x
	YBdO3q88ey97mR34FtV/IsN3vrrd
X-Received: by 10.13.232.7 with SMTP id r7mr14092540ywe.0.1506969584886;
	Mon, 02 Oct 2017 11:39:44 -0700 (PDT)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com.
	[209.85.218.51])
	by smtp.gmail.com with ESMTPSA id j6sm4575238ywg.44.2017.10.02.11.39.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 11:39:43 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f51.google.com with SMTP id n82so3305397oig.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 11:39:43 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAmivfr6P35b2RtbqvfucT/RKRUqkdcY3prS89CCnXRUinx4GF2E/pBEwMOi1PIm6vrcrG1z5JDolI67hMMi9E=
X-Received: by 10.202.76.22 with SMTP id z22mr5686628oia.241.1506969583059;
	Mon, 02 Oct 2017 11:39:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Mon, 2 Oct 2017 11:39:42 -0700 (PDT)
In-Reply-To: <CAJTo0LZELSTX08VNZze3V299CtoFrH=jXhXsxOJc9xiv-KxHfA@mail.gmail.com>
References: <CAP9ODKq6rzVbzwxWbwzeW4Y71eXNSaHJOPvAXZxSvU1-CQKRtQ@mail.gmail.com>
	<CAJTo0LZELSTX08VNZze3V299CtoFrH=jXhXsxOJc9xiv-KxHfA@mail.gmail.com>
Date: Mon, 2 Oct 2017 15:39:42 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoUOeoXNKwMVAGYPQ8dhMpgVPM2AJLqeypqYC3QT=rPBA@mail.gmail.com>
Message-ID: <CAP9ODKoUOeoXNKwMVAGYPQ8dhMpgVPM2AJLqeypqYC3QT=rPBA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Go SDK automated test
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
X-List-Received-Date: Mon, 02 Oct 2017 18:39:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 28, 2017 at 8:37 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 September 2017 at 20:17, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> Hello folks,
>>
>> I did try to understand the automated test infrastructure but ended
>> lost on how the code was designed. So instead I wrote down a step by
>> step test so someone which knows better the autotest infra can
>> translate it.
>>
>> git clone https://github.com/golang/dep go/src/github.com/golang/dep
>>
>> . /opt/oel/17.1-snapshot/environment-setup-i586-oel-linux
>>
>> export GOPATH=$PWD/go
>>
>> cd go/src/github.com/golang/dep
>>
>> i586-oel-linux-go build github.com/golang/dep/cmd/dep
>>
>> This will generate a dep binary on the $PWD; is it possible to someone
>> wrap it on OEQA test?
>
>
> Thanks Otavio, that's really useful.
>
> Can you file a bug with this in (and CC me)?  It's a good exercise for a new
> QA engineer.

I just did; I assigned it to you. Thanks a lot


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

