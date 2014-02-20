Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 398536F002
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 14:30:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1KEUYv9007546; Thu, 20 Feb 2014 14:30:34 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CHBSbuZvLpQ8; Thu, 20 Feb 2014 14:30:34 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1KEUSg4007540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 20 Feb 2014 14:30:30 GMT
Message-ID: <1392906622.1560.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex DAMIAN <alexandru.damian@intel.com>
Date: Thu, 20 Feb 2014 14:30:22 +0000
In-Reply-To: <1392658389-19826-1-git-send-email-alexandru.damian@intel.com>
References: <1392658389-19826-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate: list missing files for toaster
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
X-List-Received-Date: Thu, 20 Feb 2014 14:30:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-02-17 at 17:33 +0000, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
> 
> Toaster needs to record the attempts to restore
> setscene tasks that don't have a sstate file.
> 
> We build a list of tasks for which we can't find an
> sstate file, and if we're running under Toaster data
> collection, we send it off with a MetadataEvent.
> 
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  meta/classes/sstate.bbclass | 11 +++++++++++
>  1 file changed, 11 insertions(+)

I'm wondering if we should perhaps do this in bitbake and add a setscene
"missed" event type there based upon the return value of this function?

Ideally I'd like to be able to report the stats in knotty too.

Cheers,

Richard


