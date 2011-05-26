Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QPTrR-0000Y8-1E
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 08:15:57 +0200
Received: by vxd7 with SMTP id 7so334997vxd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 23:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=xkCStUt+TrNuBSo2sMAuLMQHhWkcad+PdX3S9gWRjUo=;
	b=k2LwMayqA1CKyF/siabbVlJiUMMS23IMNingBE6Zka51s+d1OuAnsYVUQOe1wazp/+
	4oUz/akhVv4IXg+C/zb1O1L3Unx7JsvMKOHUfFjdTfhV2sHSA60XCFUsRdX1k9SJUMWG
	X2J46/Fok6Gjrs6UTQUforJxpmBvC/48Y3clk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=WLg+70f++yGM8kMqeiZlryL8C77evAm0SOEP/bgsslKJ1PPYb9C88evWG4Vu4h81I8
	kmwEmMB7+9cVoOSDwN8iosumJTs/gyyUcarTN0TmC2bBqim6vqWGCoimRVYl2MsskeSS
	6iOYr2yBH+iGXvgfrLwVSPGkF0m9FV5U17x+o=
MIME-Version: 1.0
Received: by 10.52.181.69 with SMTP id du5mr620352vdc.113.1306390368705; Wed,
	25 May 2011 23:12:48 -0700 (PDT)
Sender: anders.darander@gmail.com
Received: by 10.52.187.69 with HTTP; Wed, 25 May 2011 23:12:48 -0700 (PDT)
In-Reply-To: <4DDD4D1B.5050301@linux.intel.com>
References: <4DDBDE9D.5000709@linux.intel.com> <1306338695.27470.41.camel@rex>
	<BANLkTim8VzrP7Zd4yDRaa75X0gXUL7wC=g@mail.gmail.com>
	<20110525164919.GB11519@mail.familie-heinold.de>
	<4DDD4D1B.5050301@linux.intel.com>
Date: Thu, 26 May 2011 08:12:48 +0200
X-Google-Sender-Auth: N48oBRR-9TNCUxMnvwtfymowTHc
Message-ID: <BANLkTiki898J_iurgJQ971o4aA1A3Yko0g@mail.gmail.com>
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Thu, 26 May 2011 06:15:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 25, 2011 at 20:40, Darren Hart <dvhart@linux.intel.com> wrote:
> On 05/25/2011 09:49 AM, Henning Heinold wrote:
>> I agree with khem, each machine should maintain it's bootloader in his bsp
>> or layer.
>
> I'm leaning this way as well. I think oe-core should remain at an
> official u-boot tagged release, like 2011.03 and layers can then extend
> that with a proper .bbappend file. Then we can share the u-boot core
> recipe and just add backported patches in the layers as needed.

This definitely seems like the best solution.

BSP specific patches and modifications can normally easily be handled
in a .bbappend file. Together with the suggestion in another e-mail
(or even thread) to keep one old u-boot version around in oe-core, to
ease the transition to a new version in the BSP layers, this should be
no real problem.

If a machine for some reason needs a specific custom version, then it
might be necessary for that particular BSP layer to carry a complete
u-boot recipe. But this shouldn't be a common situation. (And if it
happens frequently, then the machine specific patches really has to be
submitted to upstream u-boot.).

Regards,
Anders

-- 
Anders Darander


