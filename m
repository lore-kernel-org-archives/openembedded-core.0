Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41409605B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 15:14:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s49FEjKs004346
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 May 2014 08:14:46 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Fri, 9 May 2014 08:14:45 -0700
Message-ID: <536CF0E6.9060800@windriver.com>
Date: Fri, 9 May 2014 10:14:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1399591490-13000-1-git-send-email-mark.hatle@windriver.com>
	<CAJTo0LZ75OkvT+yNkbczmqVT1=xSCu1PZainWDyWXAy8Frro+Q@mail.gmail.com>
In-Reply-To: <CAJTo0LZ75OkvT+yNkbczmqVT1=xSCu1PZainWDyWXAy8Frro+Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: Add /run/lock as a standard directory
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
X-List-Received-Date: Fri, 09 May 2014 15:14:48 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/14, 4:16 AM, Burton, Ross wrote:
> On 9 May 2014 00:24, Mark Hatle <mark.hatle@windriver.com> wrote:
>> The /run/lock directory was being dynamically created during package install,
>> but should have been owned by the base-files package.
>
> Doesn't do_install generate the /var/run/lock -> /run/lock symlink, as
> /run is always a tmpfs so has to be populated on boot?
>

The /var/run/lock -> /run/lock symlink is generated, but the /run/lock is never 
created by anything that I could find.

/run is not always a tmpfs...  We've got configurations where it's persistent.

With that said, the fix may be incorrect though if something is generally used 
to create this as a tmpfs, which package would normally create the directory and 
populate it?  the volatiles code?

--Mark

> Ross
>


