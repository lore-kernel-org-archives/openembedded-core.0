Return-Path: <jan.kiszka@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 243676069C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 18:32:27 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v57IWI2J007832
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 7 Jun 2017 20:32:19 +0200
Received: from md1f2u6c.ww002.siemens.net ([139.25.68.37])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v57IWFso006205;
	Wed, 7 Jun 2017 20:32:18 +0200
To: "Davis, Michael" <michael.davis@essvote.com>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <15e918fb-c2e6-3005-6221-08601c804271@siemens.com>
	<a60f39a6-8355-82dc-20b2-5f7b3d6397b3@linux.intel.com>
	<af72aeb2-915e-0c63-60e9-18b6c7bce5ad@siemens.com>
	<615663ca-d13f-9bca-6e3d-e5dc22cfaebf@linux.intel.com>
	<3989e16e-7a69-5f0a-90e9-3fcd1ed8b14d@siemens.com>
	<655290B7709079438B7932553958E60DA1312205@ESS-EX01.essvote.corp.local>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6e9eccd2-6aee-7605-f934-39bc5dcca51a@siemens.com>
Date: Wed, 7 Jun 2017 20:32:15 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <655290B7709079438B7932553958E60DA1312205@ESS-EX01.essvote.corp.local>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Fun with npm shrinkwrap
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
X-List-Received-Date: Wed, 07 Jun 2017 18:32:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-06-07 16:09, Davis, Michael wrote:
> If offline builds, license checking, or stable dependency versions are not important to you then you can use the meta-nodejs layer.  It just uses the yarn tool directly https://github.com/imyller/meta-nodejs.
> 

In fact, meta-nodejs is already in use here, and I've been told to give
"inherit npm-base" a try. Is that what you mean?

How "unreproducible" will builds become? The license checks are not that
critical as I wouldn't trust them right now anyway. Offline builds
correlate with reproduciblilty - we need to archive the artifacts and
generate images with changes later on, independent of what happened
outside meanwhile. Not a killer right now, but not an option on the long
run.

> 
> On a hijacked side note has yarn been considered as a solution to some of our npm issues?
> It seems to be npm with built in licnese checking and better version determination.
> Might not cover 100% of our use cases, but then npm only seems to work 50% of the time without tweaking something anyways.
> 

Can't comment on yarn, but another colleague pointed out that the
machinery of arch-linux may also be worth a look, not only for the
nodejs/npm galaxy.

Thanks,
Jan

PS: Top-posting is considered evil.

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

