Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5482072F24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 09:37:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5R9brDt008247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 27 Jun 2017 10:37:54 +0100
Message-ID: <1498556273.3124.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Tue, 27 Jun 2017 10:37:53 +0100
In-Reply-To: <1498555300.7464.35.camel@intel.com>
References: <CA+chaQcmksz0eGEwb9RZ9B_7JFaB7e97iNCoWCp84zJEkqpHoA@mail.gmail.com>
	<1498550932.7464.29.camel@intel.com>
	<CA+chaQf=qedEY+V7b8WUG=YNKwANzTSabaY4DNZMa81V7-MiPQ@mail.gmail.com>
	<1498551943.3124.4.camel@linuxfoundation.org>
	<1498555300.7464.35.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 27 Jun 2017 10:37:54 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Never ending stream of bitbake exceptions when the builder runs out of disk space
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
X-List-Received-Date: Tue, 27 Jun 2017 09:38:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-27 at 11:21 +0200, Patrick Ohly wrote:
> On Tue, 2017-06-27 at 09:25 +0100, Richard Purdie wrote:
> > 
> > So if its not default, we should make it default and I'd encourage
> > people to use it.
> It's not the default at the moment because it's only in
> local.conf.sample, which people might not use.
> 
> So should a default for BB_DISKMON_DIRS be set in bitbake.conf?

No, I don't think this belongs in bitbake.conf.

If you use a nodistro setup you do get a reasonable default value for
this, you're right and it is in the default local.conf.sample. Its up
to distros and users to select the pieces they need/want beyond that.
Whilst Martin is close to nodistro it sounds like this config was
missing and I'd suggest using it.

Cheers,

Richard


