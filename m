Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web09.12441.1606839233114169530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 08:13:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.228.105])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id B1D19A2B5F;
	Wed,  2 Dec 2020 05:13:46 +1300 (NZDT)
Authentication-Results: linuxplesk15.openhost.net.nz;
	spf=pass (sender IP is 151.210.228.105) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] classes/kernel*: allow disabling symlink creation
Date: Wed, 02 Dec 2020 05:13:46 +1300
Message-ID: <5243521.Sb9uPGUboI@linc>
In-Reply-To: <CA+chaQdMdRJJTQfTADj5TjJWm4y4kOj7X5_FChaG_zX5TsBmSw@mail.gmail.com>
References: <cover.1606352479.git.paul.eggleton@linux.microsoft.com>
	<3140175.5fSG56mABF@linc>
	<CA+chaQdMdRJJTQfTADj5TjJWm4y4kOj7X5_FChaG_zX5TsBmSw@mail.gmail.com>
MIME-Version: 1.0
X-PPP-Message-ID: <20201201161346.138873.21811@localhost6.localdomain6>
X-PPP-Vhost: softec.co.nz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin

(replying all this time)

On Tuesday, 1 December 2020 15:40:36 NZDT you wrote:
> Can we use a separate variable controlling this behavior other than
> *_LINK_NAME variables being set to empty?
>
> Then we could easily extend it to stop creating the links also for image
> artifacts as well.

Well, I didn't call it out explicitly but I was just mirroring the image 
artifacts behaviour - we set those to "" as well and there are checks there 
already to make that disable the symlink in that case.

Paul


