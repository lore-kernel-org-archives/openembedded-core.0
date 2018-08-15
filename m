Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ACB7478E1C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 09:02:39 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7F92Zjg004417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 15 Aug 2018 10:02:36 +0100
Message-ID: <7746978f9f822c10c4236f96c1af43f6cd6ad735.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Isaac Nickaein <nickaein.i@gmail.com>, ross.burton@intel.com
Date: Wed, 15 Aug 2018 10:02:35 +0100
In-Reply-To: <CA+NJmkdCRHgRLUZz0bm3sALnCt+o91g=rDG4Rht+Q8H5MVBj6Q@mail.gmail.com>
References: <CA+NJmkes2FzO3OvTVxjL075A5G_UMUjj_J-oc1BtjThTQ=YiZg@mail.gmail.com>
	<CAJTo0LaSOFApbGM6OpBWhkQUEdPk9qvXy-q+HWyiSVMku7G4=g@mail.gmail.com>
	<CA+NJmkdCRHgRLUZz0bm3sALnCt+o91g=rDG4Rht+Q8H5MVBj6Q@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: iotop: failure, python module subprocess is missing
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
X-List-Received-Date: Wed, 15 Aug 2018 09:02:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-15 at 13:03 +0430, Isaac Nickaein wrote:
> > Yes.  Should be a simple fix. :)
> 
> As a workaround, I added  iotop_%.bbappend to my layer with following
> content:
> 
> RDEPENDS_${PN} += " python-subprocess "
> 
> This fixed the issue but I'm not sure if this is the *correct* fix.
> There could be some other bug or some other higher-level missing
> dependency that could be overseen.

I think Ross is implying you should send a patch to OE-Core so we can
fix the main recipe by adding the missing dependency.

Cheers,

Richard

