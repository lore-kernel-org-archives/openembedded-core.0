Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QcJha-0001kO-8x
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 18:02:50 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QcJdz-0006lL-Ei from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 08:59:07 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 30 Jun 2011 08:59:07 -0700
Received: from [172.30.80.212] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 30 Jun 2011 08:59:06 -0700
Message-ID: <4E0C9D43.6020504@mentor.com>
Date: Thu, 30 Jun 2011 08:58:59 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 30 Jun 2011 15:59:07.0281 (UTC)
	FILETIME=[A469F810:01CC373E]
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal	errors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2011 16:02:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/30/2011 08:11 AM, Koen Kooi wrote:
> These were turned off by:
> 
> 	commit fae8d5e985e9b05ce90f1eca434ad4dbf2259725
> 	Author: Richard Purdie <rpurdie@linux.intel.com>
> 	Date:   Thu Jul 8 23:51:06 2010 +0100
> 
> 		insane.bbclass: Relax fatal errors for now until we get have time to work through the backlog
> 
> The current metadata triggers so many of these that they need to be made fatal so people will actually fix them.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Given that a number of them can probably just be pulled from oe.dev as
fixes too:

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  meta/classes/insane.bbclass |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index f7e5524..e06d2b2 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -115,7 +115,6 @@ def package_qa_make_fatal_error(error_class, name, path,d):
>  
>      TODO: Load a whitelist of known errors
>      """
> -    return False
>      return not error_class in [0, 5, 7, 8, 9]
>  
>  def package_qa_write_error(error_class, name, path, d):


-- 
Tom Rini
Mentor Graphics Corporation


