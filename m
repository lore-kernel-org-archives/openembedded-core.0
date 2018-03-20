Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E2F6178690
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 23:07:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2KN7bja020819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 20 Mar 2018 23:07:39 GMT
Message-ID: <1521587257.25754.206.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>,
	openembedded-core@lists.openembedded.org, manjukum@xilinx.com
Date: Tue, 20 Mar 2018 23:07:37 +0000
In-Reply-To: <1521577519-32315-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
References: <1521577519-32315-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] wget.py: handle BBFetchException
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
X-List-Received-Date: Tue, 20 Mar 2018 23:07:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-03-20 at 13:25 -0700, Bhargava Sreekantappa Gayathri
wrote:
> When BB_NO_NETWORK is set to 1 and the first mirror url needs network
> access, then bitbake will just fail and report error instead of going
> through the list of mirror urls. This is because BBFetchException is
> not
> handled when wget is called.
> 
> This patch calls wget with a except blocks which returns to the
> previous
> function instead of failing immediately.

This doesn't look right to me unfortunately. It looks like you special
cased one fetcher module when mirrors using other fetchers could also
fail. I'd have expected a patch to fix this somewhere in the mirrors
code, not in individual fetchers.

Am I missing a bug in the wget fetcher?

Cheers,

Richard

