Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 41A4C60144
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 06:19:36 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id e4so3463191wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 23:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=v6hGzbZ6jgbxMtoiPQ2SoPguR3P32x/5AJtLe7zVksY=;
	b=Ao468sHrmS0VNs+TRM3jd3wmkM6QvBE8Do3RNx0U0hcpEZsHnZCntbb+bmxYuDQZEE
	iLJOJLql80XeaohPukRKL9GIijmha+XurCZllhJpbY7IBwHsLeF4M+SbcMO+/qZKM7wI
	FyUUqIDmO9S7NwiEeRTcios/Ie3AFPexVUG3ezbJ353a+AAFjHx2GzA8Z7CuuC/nOXfb
	71M/TsYHCGjRR4rlsytSTxkcAVw2C8cQXyaZAdmIyjsuHflULON05z1lbKacYtT287PX
	M0ozc4UGRoLXMvdg96zIp5WETKNs6zF4k+0uPUieEHG+RC8HzQAeDwOo5GpqRkFQUy+T
	wMig==
X-Gm-Message-State: ALoCoQkEbMqr2mm266J7i1abIbvRy86sX/9KTfdJPQsSOcL9Ei1c6vv+GC+sJ+T4XyCq2lpxfPeS
X-Received: by 10.180.9.144 with SMTP id z16mr21119112wia.26.1410761977116;
	Sun, 14 Sep 2014 23:19:37 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id
	au4sm13614452wjc.15.2014.09.14.23.19.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Sep 2014 23:19:36 -0700 (PDT)
Message-ID: <541684F7.8040708@dresearch-fe.de>
Date: Mon, 15 Sep 2014 08:19:35 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
References: <541034FD.4090900@dresearch-fe.de>
In-Reply-To: <541034FD.4090900@dresearch-fe.de>
Subject: Re: hash generation for PR Service?
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
X-List-Received-Date: Mon, 15 Sep 2014 06:19:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 10.09.2014 13:24, Steffen Sledz wrote:
> I'm not sure if this is the right mailing list for our problem. Please forgive me if not (and tell me the right one).
> 
> 
> We're investigating some problems related with package versions going backwards using a PR Service[1].
> 
> Can someone give some hints where we can get information about generation of the hashes which are used to request values from the PR service? Especially which data/files/directories are involved..
> 
> 
> [1] <https://wiki.yoctoproject.org/wiki/PR_Service>

Ping! Who can provide related information?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

