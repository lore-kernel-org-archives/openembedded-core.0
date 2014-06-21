Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3895A6FD34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jun 2014 13:13:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5LDD9nQ019471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 21 Jun 2014 06:13:09 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Sat, 21 Jun 2014 06:13:08 -0700
Message-ID: <53A584E3.3010508@windriver.com>
Date: Sat, 21 Jun 2014 21:13:07 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20140621122616.19509.qmail@f4mail-235-223.rediffmail.com>
In-Reply-To: <20140621122616.19509.qmail@f4mail-235-223.rediffmail.com>
Subject: Re: [bitbake-devel] Hi
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
X-List-Received-Date: Sat, 21 Jun 2014 13:13:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

I think that this email should go into oe-core mailing list (see
the CC). You can refer to:

oe-core/meta/classes/image_types.bbclass:

IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C 
${IMAGE_ROOTFS} ."
COMPRESS_CMD_bz2 = "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"

I think that you can add something like the following to your recipe:

COMPRESS_CMD_bz2_append () {
	<your shell script>
}

Then the script would run after the .tar.bz2 is created.

// Robert

On 06/21/2014 08:26 PM, Himanshu Pandey wrote:
> Hi,
>
> I have a requirement that once the .tar.bz2 is created I want my shell script to
> be executed finally.
>
> So where do I have to add this?
>
> So what I have to do in order to achieve this.
>
> Regards,
> Himanshu Pandey
>
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
> Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company email.
> 	*Know More >*
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>
>
>

