Return-Path: <zeenix@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id E4EDB780CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:40:23 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id d14so34934942qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=GbFfBwMvqUmmHNQwSRfGMzwQX5QoN03QYsmNAiD/eHg=;
	b=FwTCRGNRjJeaTT9sMUggpPdfVAIV+nmM2E5ThYL0Vij1rXvvtreSgTpXpIaaV63qeb
	wVaybQ4Sab1Tkm7Ohkum9dYUxv9Lb6czKJsiiHz8btcOo2wNX5SPbSc4f+2DDh5apENQ
	imVhTshv8mBL95HxWJ8/85jG0Yl6DymLQ56qx7C68a9sNjtLAeP5pJPhDa/pl/F+OYe1
	wZunxBvzsHltOGRePcgWq+x5eJRksGlyvMOd72lPXc0PsEV0WpXOAt68CBOixKH7pI4t
	RLjBTXEh7VxtU4I7XkSpdtfoRRnEsxQk8BOm6jJaDoRy48RCgYZnAZqqPZrqnFsR/96m
	nVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=GbFfBwMvqUmmHNQwSRfGMzwQX5QoN03QYsmNAiD/eHg=;
	b=uj1OT9dlu1etjmqbvnN33VN7m/tFN9LgH0fncUnhqXed1aiojnirUIi2XfeQoFw/Vg
	5Na0fN0JZHnEyoaGZ7kbQnR89acFWrml8tRSQUSPN/zixFJabb6NItF9QTlfIqTIUlov
	CUBONPcSI92JEuGyDsDBCKW1Me3fLcL5pWTa2Xh3RiXtMIF3fiFlccie+knB0f3I0mZl
	DQwzV0K1chm8RYd1wZ/tqqzkZyzuNU3IIvyW8e8fbHhj6UmVnjfunAqvHFCNBaiHiOsv
	GM3pE7nAnnqYI35y//w3SCmgXoe8MMlfPq92jWZzvR418C9l9SgxmFGeeTv00xAhvwXm
	hpIQ==
X-Gm-Message-State: AKS2vOxioznYaefO6LU7uTkGVm8SaxsZuCMUSA7O/buJRQyl1i53im+T
	Nyrba+By1yCPNa1lDGj99BpgE9ZA2A==
X-Received: by 10.55.114.2 with SMTP id n2mr26515778qkc.157.1497883224837;
	Mon, 19 Jun 2017 07:40:24 -0700 (PDT)
MIME-Version: 1.0
Sender: zeenix@gmail.com
Received: by 10.200.11.203 with HTTP; Mon, 19 Jun 2017 07:40:24 -0700 (PDT)
In-Reply-To: <20170615180542.GA16912@ptan20-mobl.gar.corp.intel.com>
References: <20170529060935.8093-1-erik.boto@pelagicore.com>
	<20170529060935.8093-2-erik.boto@pelagicore.com>
	<CAAa3hFMMxVRMRNufBenQ7E1G3stW0Xvu8xeE94MPfOa-J35axA@mail.gmail.com>
	<20170615180542.GA16912@ptan20-mobl.gar.corp.intel.com>
From: "Zeeshan Ali (Khattak)" <zeeshanak@gnome.org>
Date: Mon, 19 Jun 2017 16:40:24 +0200
X-Google-Sender-Auth: zLvtdjpx6r9EVEYeY9tXFGwA7wA
Message-ID: <CAAa3hFNkLE98Zk3=if9=tp5OGqiQMJE-zrTFKkPZs2gLW3Gw5g@mail.gmail.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Cc: Leonardo Sandoval Gonzalez <leonardo.sandoval.gonzalez@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/4] masterimage.py: fix issue with calling reboot on masterimage/DUT
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
X-List-Received-Date: Mon, 19 Jun 2017 14:40:24 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Stephano,

On 15 June 2017 at 20:05, Stephano Cetola
<stephano.cetola@linux.intel.com> wrote:
> On 06/15, Zeeshan Ali (Khattak) wrote:
>> Hi,
>>
>> Has this been already merged? I ask cause there is a small change
>> needed for large-enough rootfs:
>>
> This has not been merged yet.
>
> Erik, could you please send a V3?
>
> When you do so, please reference the bug in the commit messages like this:

Erik is on a long vacation+paternity leave so I'll do this on his behalf.

-- 
Regards,

Zeeshan Ali

