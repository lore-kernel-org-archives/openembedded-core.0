Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9086F73163
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 07:48:15 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id l89so13815135lfi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=IQbA9DtxoWd7HfF5tMmbJy5pPGuZ1VCSz9QOHQy5M08=;
	b=cgfpuSYTE4OQFHn8HrhRupOdY8qz7L0R+Nj3ofi+05uazrVTW52halEC7qsvM+n2Eh
	6tROBgOikX+Us+HjohLfSj4eDm7wHaSCcndctI5aNMTgAC5rFxN2nNlhxy3UlQY54XGS
	C03r14Ka2eGn+XIhASY+hdKeUxQdLbVBJIzC/JgQCs7KCHT3HM+z1a3id7yiVg7/62q9
	JNA+7q4SLuz9iEJpFJS31CynIAs1ALy1qqhmctwYzK+2byHFkLbL+g05e+irycPSdJPz
	0wuaFf1dBmy6ayZ9Harsgvt7e+bKkdBRL1Fw0yFz7xQz01jZcKNNnUg8aW83A2VheV1N
	X9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=IQbA9DtxoWd7HfF5tMmbJy5pPGuZ1VCSz9QOHQy5M08=;
	b=bvT9appsdqWfcq5oFIKK05Fzmbc4AZKEEcSPGbfcEJDM4DJes57w6D1Ky3pb84Btgu
	iT78Fyfm9TmhS67DbbVggEGyGN2NE3h3mCH4uqsCprnlb8lfYEZfadGz4nzdxbdL2XF0
	hy1wNOaqUV67Fae1OkBT1I+IUpNPoWbTxVCu7wJ1gIfVt8FK8sCZkmA3MfP/jN/vi6zs
	gDdbNV3kaHCGFwLTG1dW0H4tQsRkyQ3FXWJrxBI7LRzhap9cTbIX//JSQtLV796Nj0sP
	R/JPamw69spP30lEd8cXEe2AY+jVI5grPb8bOicG0JE456/1VSGv4XMpwQERO5fr7/28
	XFdA==
X-Gm-Message-State: AEkoouvQgHF0gsjBajk7cLD2D3U/7wxr1upajnEpEyRsXGPoqpZNd+BFPvFoPwihtq/L8w==
X-Received: by 10.25.150.141 with SMTP id y135mr20305500lfd.66.1470296894788; 
	Thu, 04 Aug 2016 00:48:14 -0700 (PDT)
Received: from skeletor.greyskull ([89.253.118.72])
	by smtp.gmail.com with ESMTPSA id 67sm2179677ljj.8.2016.08.04.00.48.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Aug 2016 00:48:14 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1469552171-8500-1-git-send-email-jacob.kroon@gmail.com>
	<1e6c0615-e39a-e2c3-23dd-992a03e06901@gmail.com>
	<CADkTA4MYqHCQ0AiR72dxhVAVw0=K7Ui-F3ip3jS9x6gUE_5VqA@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <dfd0136b-fb2a-51a2-b66a-3d5e63c5d2e1@gmail.com>
Date: Thu, 4 Aug 2016 09:48:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4MYqHCQ0AiR72dxhVAVw0=K7Ui-F3ip3jS9x6gUE_5VqA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: Don't package kernel meta-data
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
X-List-Received-Date: Thu, 04 Aug 2016 07:48:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2016 03:41 AM, Bruce Ashfield wrote:
> On Wed, Aug 3, 2016 at 5:33 AM, Jacob Kroon <jacob.kroon@gmail.com
> <mailto:jacob.kroon@gmail.com>> wrote:
[...]
>     Ignore this patch, I'm suspecting that .kernel-meta/ directory
>     shouldn't exist in ${STAGING_KERNEL_DIR} to begin with ?
>
>
> It doesn't hurt anything by being there, but you can either intercept it
> at the
> time we stage the common kernel parts, or when you package devsrc .. either
> will work.

Since commit 3b49416fc7a7ee9bfe722f2e6089aa18df41dc58, linux-yocto.inc
does:

do_install_append(){
	if [ -n "${KMETA}" ]; then
		rm -rf ${STAGING_KERNEL_DIR}/${KMETA}
	fi
}

But I think this accidentally got broken by a later commit
3b2b4eef0fd06099342fcc2dfa35ecf37840c090, which changed the directory
name by conditionally prepending a ".":

kmeta = d.getVar( "KMETA", True ) or "meta"
if not os.path.exists(kmeta):
     kmeta = "." + kmeta

So it seems to me that the right thing to do here would be to fix and
move the do_install_append() to kernel-yocto.bbclass. Bruce, what do
you think ?

Regards Jacob

