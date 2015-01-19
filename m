Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE2071708
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 01:07:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0J17vYp022780
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 17:07:58 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Sun, 18 Jan 2015 17:07:57 -0800
Message-ID: <54BC58EC.6070406@windriver.com>
Date: Sun, 18 Jan 2015 19:07:56 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CADV-EXFaVwA2kjDo3e9VvO-sodxpxTo6HFDis1oD_36oq3NehA@mail.gmail.com>
In-Reply-To: <CADV-EXFaVwA2kjDo3e9VvO-sodxpxTo6HFDis1oD_36oq3NehA@mail.gmail.com>
Subject: Re: RPM package generation architecture
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
X-List-Received-Date: Mon, 19 Jan 2015 01:08:03 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 1/18/15 4:55 PM, Yevhen Kyriukha wrote:
> Hi
> 
> I'm building RPM packages for ARM board.
> I'm getting packages generated for 3 architectures: all, raspberrypi,
> armv6hf_vfp.
> I can't install any of these packages with rpm as it uses "uname" to
> get current machine arch and "uname" outputs "armv6l" arch. Also "all"
> should be "noarch" for rpm.
> I want that packages have "proper" arch: "noarch" and "armv6l".
> Could someone give suggestions on this, please?
> 

You are using the wrong version of RPM.  You need to use the version (RPM5) that
is configured by the system during the filesystem generation, along with the
platform file (/etc/rpm/platform) to specify to the system what is allowed.

RPM4 (which it sounds like you are using) does not have an easily adjustable
table of package names.  To install Yocto Project packages, you will need to
patch it to define the additional names.

--Mark

