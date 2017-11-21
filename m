Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 1364 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 Nov 2017 14:30:02 UTC
Received: from cpanel2.indieserve.net (cpanel2.indieserve.net [199.212.143.6])
	by mail.openembedded.org (Postfix) with ESMTP id AB9DB78711
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 14:30:02 +0000 (UTC)
Received: from 69-196-158-250.dsl.teksavvy.com ([69.196.158.250]:51912
	helo=DESKTOP-1GPMCEJ) by cpanel2.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1eH9Cp-0002i1-AM; Tue, 21 Nov 2017 09:07:19 -0500
Date: Tue, 21 Nov 2017 09:05:58 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@DESKTOP-1GPMCEJ
To: Ross Burton <ross.burton@intel.com>
In-Reply-To: <20171121131446.14248-1-ross.burton@intel.com>
Message-ID: <alpine.LFD.2.21.1711210905440.6121@DESKTOP-1GPMCEJ>
References: <20171121131446.14248-1-ross.burton@intel.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel2.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel2.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel2.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] verify-bashisms: use argparse, add verbose option
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
X-List-Received-Date: Tue, 21 Nov 2017 14:30:02 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 Nov 2017, Ross Burton wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  scripts/verify-bashisms | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
> index dab64ef5019..a979bd29650 100755
> --- a/scripts/verify-bashisms
> +++ b/scripts/verify-bashisms
> @@ -89,7 +89,13 @@ def get_tinfoil():
>      return tinfoil
>
>  if __name__=='__main__':
> -    import shutil
> +    import argparse, shutil
> +
> +    parser = argparse.ArgumentParser(description='Bashim detector for shell fragments in recipes.')
                                                     ^^^^^^ ???

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

