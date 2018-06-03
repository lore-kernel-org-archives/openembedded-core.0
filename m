Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 69E3D74D58
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 16:08:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w53G8NSH020733
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 3 Jun 2018 17:08:24 +0100
Message-ID: <35cf35b34652831383bdac254edc03a479543e15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dengke Du <dengke.du@windriver.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Date: Sun, 03 Jun 2018 17:08:23 +0100
In-Reply-To: <0b696fa7-bf61-d6f6-34a8-f63e4c827a60@windriver.com>
References: <cover.1527735211.git.dengke.du@windriver.com>
	<59e700bb0582088cba026b990ed423ab0d1e2ebe.1527735211.git.dengke.du@windriver.com>
	<CADkTA4MU3Po893UfDcTeusYA0kkJdMHFHPWx3Z3RdMJS5gj8Xg@mail.gmail.com>
	<0b696fa7-bf61-d6f6-34a8-f63e4c827a60@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto: add ptest support
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
X-List-Received-Date: Sun, 03 Jun 2018 16:08:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-06-01 at 15:52 +0800, Dengke Du wrote:
> 
> 
> On 2018年05月31日 12:19, Bruce Ashfield wrote:
> > 
> > On Wed, May 30, 2018 at 11:08 PM, Dengke Du <dengke.du@windriver.co
> > m> wrote:
> > > Signed-off-by: Dengke Du <dengke.du@windriver.com>
> > > ---
> > >  meta/recipes-kernel/linux/files/run-ptest     | 138
> > > ++++++++++++++++++++++++++
> > > 
> > 
> > Nothing else in linux-yocto uses "files", and this shouldn't
> > either.
> > 
> > We can't guarantee that these are version independent, so they need
> > to be in  a versioned
> > kernel subdirectory.
>  
> Ok, I will put it in versioned kernel subdirectory.

It doesn't have to be versioned, it can be "linux-yocto" if it really
isn't version specific. It really shouldn't be "files" though.

Cheers,

Richard

