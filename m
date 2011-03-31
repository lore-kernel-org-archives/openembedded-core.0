Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q5K7d-0000tq-Rr
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 17:49:22 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q5K5i-0001tk-9X from Tom_Rini@mentor.com ;
	Thu, 31 Mar 2011 08:47:22 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 31 Mar 2011 08:47:22 -0700
Received: from [172.30.80.77] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Thu, 31 Mar 2011 08:47:21 -0700
Message-ID: <4D94A1FF.1010909@mentor.com>
Date: Thu, 31 Mar 2011 08:47:11 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Ben Gardiner <bengardiner@nanometrics.ca>
References: <a5c403f0fc71f38c0669691da7f637303ea09a27.1300978024.git.richard.purdie@linuxfoundation.org>
	<cover.1301544780.git.bengardiner@nanometrics.ca>
In-Reply-To: <cover.1301544780.git.bengardiner@nanometrics.ca>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 31 Mar 2011 15:47:22.0114 (UTC)
	FILETIME=[EC82C620:01CBEFBA]
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] port oe-dev ,ubifs.img link support
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
X-List-Received-Date: Thu, 31 Mar 2011 15:49:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 03/30/2011 09:36 PM, Ben Gardiner wrote:
> I made some changes in oe-dev to normalize the link names used for the 
> ubifs images created when the type is ubifs vs. when the type is UBI. 
> The changes we two-fold: make symlinks to either .rootfs.<type> or 
> <type>.img and use the <type>.img extension for the ubifs images when 
> they are intermediate for UBI image generation as well as the final 
> target.
> 
> The changes were accepted by Tom Rini for oe-dev and Denys Dmytriyenko 
> for arago.
> 
> I've only just begun following the oe-core list and I noticed your 
> (Richard's) changes to introduce image_type.bbclass to oe-core. When I 
> looked closer at the changes I could see that there had been no sync-up 
> from oe-dev to oe-core since the changes I mentioned above.
> 
> This changeset should align oe-core with those recent changes in oe-dev; 
> the changes I made were dependent on Bernhard's change to replace the 
> symlink target with 'ln -f' instead of 'rm'ing it first; so I ported his 
> commit also.
> 
> I'm sorry to say that there has been no testing of these changes with 
> oe-core. I would be interested in trying a test build... but I must admit
> I don't know what MACHINE+DISTRO+image to try as a simple test build.
> 
> Ben Gardiner (2):
>   image_types.bbclass: add link to .rootfs.<type> or .<type>.img
>   image_types.bbclass: use .ubifs.img extension in IMAGE_CMD_ubi
> 
> Bernhard Reutner-Fischer (1):
>   image_types.bbclass: rm symlink destination via ln
> 
>  meta/classes/image_types.bbclass | 11 +++++++----
>  1 files changed, 7 insertions(+), 4 deletions(-)

Thanks for doing this.  The whole series looks good to me,
Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


