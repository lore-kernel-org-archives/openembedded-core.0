Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 13DFC78D02
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 14:01:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5CE1kl3008732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 12 Jun 2018 15:01:47 +0100
Message-ID: <40a4d15ed93cffdd15acd88fab2b9492b5a81ca9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 15:01:46 +0100
In-Reply-To: <20180612133705.876-1-ross.burton@intel.com>
References: <20180612133705.876-1-ross.burton@intel.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] rm_work: remove obsolete rm_work_all task
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
X-List-Received-Date: Tue, 12 Jun 2018 14:01:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-06-12 at 14:37 +0100, Ross Burton wrote:
> *all tasks have been deprecated and replaced by bitbake --runall.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/rm_work.bbclass | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/meta/classes/rm_work.bbclass
> b/meta/classes/rm_work.bbclass
> index 318d121d2b5..ff74d232c97 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -115,12 +115,6 @@ do_rm_work () {
>          fi
>      done
>  }
> -do_rm_work_all () {
> -    :
> -}
> -do_rm_work_all[recrdeptask] = "do_rm_work"
> -do_rm_work_all[noexec] = "1"
> -addtask rm_work_all after before do_build
>  
>  do_populate_sdk[postfuncs] += "rm_work_populatesdk"
>  rm_work_populatesdk () {

The idea was to remove the "all" tasks which could be done
better/differently.

I think this one may be an integral part of how rm_work gets triggered
and that without this, bits of the build won't get cleaned up. The key
part is the "before do_build", i.e. its active in the taskgraph of
standard builds.

Cheers,

Richard


