Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8C165CB5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 16:25:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u19GPGMZ014739
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Feb 2016 08:25:16 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Feb 2016 08:25:15 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1455032462-124215-1-git-send-email-mark.hatle@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56BA12EA.20104@windriver.com>
Date: Tue, 9 Feb 2016 10:25:14 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455032462-124215-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [RFC][PATCH] Resolve an issue when using pipes to process data
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
X-List-Received-Date: Tue, 09 Feb 2016 16:25:16 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

(Had someone ask me where the patch is..)

Our wonderful corporate mail server sucks.. so the thread didn't get attached
with the patch.

This is the cover letter, the patch has the subject:
[RFC][PATCH] buildhistory.bbclass: Break up the find to catch failures

--Mark

On 2/9/16 9:41 AM, Mark Hatle wrote:
> I'm sending this as an RFC.  I know the patch works, but I think it highlights
> a potentially larger issue in the system.
> 
> If we're processing data using shell pipes, the return code of a failed
> process may end up being lost -- avoiding the regular error capture when
> bitbake runs a task.
> 
> In this particular case, while working to fix a bug in pseudo we made an
> error condition fatal (triggered an abort()), but buildhistory kept on
> processing ignoring any issues had occurred.
> 
> Breaking up the processing into steps, things that 'could fail', and later
> processing steps that shouldn't fail will give us more of an opportunity to
> identify failures in the future and deal with them in a quicker manner,
> then having to investigate log files for messages.
> 
> I'm suspecting we should run a janitor exercise against oe-core looking for
> similar situations where we might be piping the data and potentially losing
> return codes in the process.
> 
> Comments?
> 
> Mark Hatle (1):
>   buildhistory.bbclass: Break up the find to catch failures
> 
>  meta/classes/buildhistory.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 


