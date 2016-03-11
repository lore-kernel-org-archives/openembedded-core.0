Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC2B73172
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 17:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2BHfZwF013983; Fri, 11 Mar 2016 17:41:35 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lQVrfzUmzu9I; Fri, 11 Mar 2016 17:41:35 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2BHfWFI013980
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 11 Mar 2016 17:41:33 GMT
Message-ID: <1457718092.2804.258.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Lock <joshua.g.lock@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 17:41:32 +0000
In-Reply-To: <cover.1457705106.git.joshua.g.lock@intel.com>
References: <cover.1457705106.git.joshua.g.lock@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [RFC PATCH 0/3] Remove RPM 4
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
X-List-Received-Date: Fri, 11 Mar 2016 17:41:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-11 at 14:07 +0000, Joshua Lock wrote:
> This series removes RPM 4 and code to support it from OE Core. There
> are
> several known issues with using RPM 4 and it seems better to
> acknowledge it's
> unsupported by removing it from OE-Core than to leave  it in a non
> -functional
> state.
> 
> Please review the following changes for suitability for inclusion. If
> you have
> any objections or suggestions for improvement, please respond to the
> patches. If
> you agree with the changes, please provide your Acked-by.

I think I'm in favour of removing it at this point as its not getting
much attention.

I'd note that we need to remove the QA test for it:

selftest/imagefeatures.py:    def test_rpm_version_4_support_on_image(self):

Cheers,

Richard



