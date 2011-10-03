Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RApDP-0000wu-3n
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 22:34:19 +0200
Received: by ywf7 with SMTP id 7so3766424ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=MVvh55+F6lhfW2uYQbnAF+nDQ4VyNZsK0CzlSrIkTQY=;
	b=B8Kam15yqmwIsKkBUmiSyIkU7MHG/ZYTnjOHABR2uWvoEkF64c56hR+gUnS1iKKN59
	9H3OxCXB1fDhth396aomY1O/vLJQY95kGJ4+UNWdJkRRWU2GZUpKhaLklBHM2/n07I6l
	fZkyTqyqwvnKozzEtdkxZTXSJKVyinulDiZAM=
Received: by 10.150.72.27 with SMTP id u27mr560036yba.246.1317673725805;
	Mon, 03 Oct 2011 13:28:45 -0700 (PDT)
Received: from [172.23.2.133] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id z5sm39290978anz.7.2011.10.03.13.28.44
	(version=SSLv3 cipher=OTHER); Mon, 03 Oct 2011 13:28:45 -0700 (PDT)
Message-ID: <4E8A1AFA.3060409@gmail.com>
Date: Mon, 03 Oct 2011 13:28:42 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CALT56yPoAbv43D_CGsGHMjr+eQxhNUJAW_Ryznoi7Tz8tb7THA@mail.gmail.com>
	<1317653702.13337.4.camel@phil-desktop>
In-Reply-To: <1317653702.13337.4.camel@phil-desktop>
Subject: Re: [RFC] .la files cleanup
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
X-List-Received-Date: Mon, 03 Oct 2011 20:34:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/2011 7:55 AM, Phil Blundell wrote:
> On Mon, 2011-10-03 at 14:58 +0400, Dmitry Eremin-Solenikov wrote:
>> My proposal would be to include a special task or a
>> do_install_append() part that
>> will remove specified .la files. (like ${libdir}/xorg/modules/*/.la,
>> ${libdir}/matchbox-panel/*.la, etc.). I see this usually done in
>> do_install or in special do_install_append
>> parts, but I think it would be better to handle this globally.
>
> I guess the ideal solution would be to find a way to stop libtool from
> installing these things in the first place.  It isn't totally obvious to
> me that the .la files are a net benefit even for real shared libraries,
> and for plugins I think they are probably a net loss in most/all cases.
>

I also have this opinion. I think we need to experiment by not 
installing .la at all and see what breaks. I would guess very little

> When this issue last came up it seemed that Richard's preferred fix was
> to just ship the .la files in FILES_${PN}-dev, and I guess that approach
> does at least have the merit of simplicity.  See:
>
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-July/005533.html
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



