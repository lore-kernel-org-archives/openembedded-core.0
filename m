Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C2B1D78965
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 22:55:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2LMsujs000888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 21 Mar 2018 22:54:57 GMT
Message-ID: <1521672896.25754.226.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Wed, 21 Mar 2018 22:54:56 +0000
In-Reply-To: <a73785d4-f3fb-374d-3a54-3ea97e85b41f@linux.intel.com>
References: <CY4PR11MB17663B664B1ED6ADE96BC48AC7D40@CY4PR11MB1766.namprd11.prod.outlook.com>
	<dd055b01-fe83-d706-bce1-5a2aea3103fe@gmail.com>
	<CAJTo0LbxDGNrJH8tDiCgMKoSHUsK8Q17BUH=UVkY8zDBAm70+g@mail.gmail.com>
	<833712e4-00aa-1e05-8df5-a0f9a18d4e29@linux.intel.com>
	<CAJTo0LadpoW1BCCbfhsEac7PBV2qNxuiWrnRk6MZeV2DVWiDEA@mail.gmail.com>
	<61d1ecb9-e4a6-8d26-9bcc-76c7c42abb7f@linux.intel.com>
	<1521561579.25754.202.camel@linuxfoundation.org>
	<a73785d4-f3fb-374d-3a54-3ea97e85b41f@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IFt5b2N0b10gWW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxMuKAmTE4?=
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
X-List-Received-Date: Wed, 21 Mar 2018 22:55:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-03-20 at 20:00 +0200, Alexander Kanavin wrote:
> On 03/20/2018 05:59 PM, Richard Purdie wrote:
> > 
> > > 
> > > > 
> > > > How long does a single run take, and why not run it every
> > > > month?
> > > Just a bit longer than a day, maybe 30 hours, if it needs to
> > > update
> > > the
> > > typical amount of 100-150 packages. I'll shift it to monthly
> > > then.
> > Personally I'm leaning to every couple of weeks...
> My worry is that shorter AUH periods will lead to reminder fatigue.
> Also the period between submitting the updates, and having them show
> up in master is sometimes less than ideal, even when the freeze is
> not in effect.

Its a valid concern? Once every three weeks? I would like to make
things more available for people if possible too...

With builds we've had a bad run at the moment and am hoping with
improvements in build resources that are in process we can fix that.

Cheers,

Richard

