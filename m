Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SSbK7-0003Ij-JJ
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:54:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 0D707315BFF3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 23:45:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id VAny2w+DMvGy
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 23:45:00 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c4e8a.pool.mediaWays.net [89.12.78.138])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D6C12315BFF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 23:44:59 +0200 (CEST)
Message-ID: <4FAC36DA.8080201@opendreambox.org>
Date: Thu, 10 May 2012 23:44:58 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1336680237-31671-1-git-send-email-obi@opendreambox.org>
	<CAMKF1spfSiBy0F-cP7Q2NYT2dg2CFqvfXxuxR_=-F2o8gdBwGw@mail.gmail.com>
In-Reply-To: <CAMKF1spfSiBy0F-cP7Q2NYT2dg2CFqvfXxuxR_=-F2o8gdBwGw@mail.gmail.com>
Subject: Re: [PATCH] e2fsprogs: fix packaging error for libext2fs
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
X-List-Received-Date: Thu, 10 May 2012 21:54:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10.05.2012 22:30, Khem Raj wrote:
> On Thu, May 10, 2012 at 1:03 PM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
>>
>> -FILES_libext2fs = "${libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
>> +FILES_libext2fs = "${libdir}/e2initrd_helper ${base_libdir}/libext2fs.so.*"
> 
> its probably not a good idea to mix files from libdir and base_libdir
> in a single
> package. Since lately we have been accommodating /usr to be mounted
> independently.

I have no idea what e2initrd_helper does, but this can still be
addressed in a later patch.

Currently, libext2fs.so.* gets packaged into the "e2fsprogs" package,
which is worse than your concerns, because it drags many unneeded
dependencies into the image.

FWIW, e2initrd_helper doesn't seem to be required during a usual boot
process, as nobody seems to have missed it. At least no automatic
dependencies on the libext2fs package were generated before this patch.

Regards,
Andreas


