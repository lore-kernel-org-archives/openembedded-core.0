Return-Path: <saul.wold@intel.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5EF65D3B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 18:30:57 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id r10so764814pdi.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 11:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=nKXuZuivWxZnK9LuhUwV6ETuStUE0blMUyFJomDl3So=;
	b=QqQoDcGM2ZOOYZD+KJdtFZ7lwqpqRYfrQVKWGOqN9WG+uWw0IWYyYwj753GKatp4zK
	3IaIuOoFXSH7va+KMwiEe4wtD2fRhUpfhdM2rrepGtGzhOIvD4opKznuGHPy2aIFnTnN
	AoZ5bx2AOux+cF9ixWUwP7LLZcUjGh9lgLGIU98ab4tJNGLz4THSOVUGh9e8WAqDQO24
	120Hc/X2RNrt1QcdiIePUg2H2n5a48amLPA+NS0y1hMx5vWEAQrknw1xGTft8MsRE0g5
	DVb7v7Cx9OZx+S0TctTQoQTkDqk9BIExjAlsvH3mwhlE4JUdZaUZQ6m+8tc2Z6jE37FT
	0NeQ==
X-Gm-Message-State: ALoCoQl+60XhlBakVQP6dgR+08TvKaDBk8OPBqM7Ch68g/t2foKa/+++D3vn2IHGPAUI38WpKl5g
X-Received: by 10.70.130.12 with SMTP id oa12mr3906844pdb.151.1414089058356;
	Thu, 23 Oct 2014 11:30:58 -0700 (PDT)
Received: from [172.20.10.4] (mobile-166-171-122-091.mycingular.net.
	[166.171.122.91])
	by mx.google.com with ESMTPSA id ne9sm2054869pbc.87.2014.10.23.11.30.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 Oct 2014 11:30:57 -0700 (PDT)
Message-ID: <5449495F.4030904@intel.com>
Date: Thu, 23 Oct 2014 11:30:55 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <CAP9ODKq2070AmmM9E4h+KWmnLM2k0H1uFG_VgD3Fg7EN2bM3BQ@mail.gmail.com>
In-Reply-To: <CAP9ODKq2070AmmM9E4h+KWmnLM2k0H1uFG_VgD3Fg7EN2bM3BQ@mail.gmail.com>
Subject: Re: [URGENT] Daisy is broken
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
X-List-Received-Date: Thu, 23 Oct 2014 18:31:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2014 11:19 AM, Otavio Salvador wrote:
> Hello,
>
> Today some backports were done in Daisy. It seems it had no test
> before pushing the stuff to the Git repository as it fails with:
>
> ERROR: Function failed: Fetcher failure for URL:
> 'file://Makefiles-ptest.patch'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in:
> .../build/tmp/work/x86_64-linux/openssl-native/1.0.1j-r0/temp/log.do_fetch.9860
>
> Looking at the commit it didn't remove the patches from source neither
> added the new ones. No test done before pushing to the official tree.
>
> Please fix it ASAP and be more careful next time, however pushed it.
>
This appears to be my fault, I asked RP to use the daisy-next branch 
this morning after I had completed some tests, what appears to have 
happened is I had not finished the push to what I asked RP to pull, 
found the "git push" sitting on a cmdline waiting for a Enter press!

I have pushed the correct set of patches into the daisy-next branch, 
which will await another round on the Autobuilder and/or RP's time to 
pull it to daisy.

Apologies to all for this.

Sau!


