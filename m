Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 92D6F6121F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:22:06 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id ma3so4000441pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=eF2GAVuAfGidfnSyQi4wd9BDqQkfyHoMYAO5DaaB+lw=;
	b=T02Ua2ZiTt0dAq5wmMVRymDdZMhnxelEDNj2amFiqzeQiGKIkMr+d9jrSoVoHEj5Ed
	0sAoL/RbziigOf9hdTv31wBlduSN1F8g7ylmLqoOPAsF1C5TscaxhGcfeiV91Wqu+ib1
	mFF03CWpwF4lmtdmVdqZOQ1YAbue07k75T1TYyTKRYBx79dHATN9SH1x8UZfOdaI1SMf
	f77arWXMK7KhFmGD/h0tlfw+EqXuf1pIH2Wtuc3wQpn2MMfXCblVzfRv5IlPOlEf6uS6
	wQSal1XZnGYgUUUy7ko3ax+4czk7LguWhxoj3zGrQqthnqDkyB037ROHGWDWi7oeJile
	YdmA==
X-Gm-Message-State: ALoCoQnkdZ3qMVkLA9Wp4TmorLMOBzWcX7fHHGQkj14H6PJecwDemgA0/fsW5gd+17091Uy37eAa
MIME-Version: 1.0
X-Received: by 10.68.249.100 with SMTP id yt4mr74645pbc.165.1393255326964;
	Mon, 24 Feb 2014 07:22:06 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 24 Feb 2014 07:22:06 -0800 (PST)
In-Reply-To: <CAP9ODKq2krk5HaemVsDqGcNowbCwaQeGpHrxWxM0rqBo09z3gw@mail.gmail.com>
References: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
	<CAP9ODKq2krk5HaemVsDqGcNowbCwaQeGpHrxWxM0rqBo09z3gw@mail.gmail.com>
Date: Mon, 24 Feb 2014 15:22:06 +0000
X-Google-Sender-Auth: VJOF6UabXt9gNJN7zsnq-3Po6f8
Message-ID: <CAOMwXhOC+2Sod+TgSA-pt+BF5gnSJVNSRA_FQ+zNTLH7=BZdow@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: No versioning for existing images
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
X-List-Received-Date: Mon, 24 Feb 2014 15:22:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 3:12 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> On Mon, Feb 24, 2014 at 9:01 AM, Laszlo Papp <lpapp@kde.org> wrote:
>> I was wondering why existing images would not have version numbers
>> attached. Say, we have a core-image-minimal image, but from the
>> recipe, it is not possible which image version it is.
>>
>> Perhaps, it is just my ignorance and lack of understand, but for the
>> moment, it seems to be an important information for e.g. distribution
>> vendors and image creators to have an image version and the
>> corresponding packages and versions attached to that particular
>> version.
>>
>> It is easier to do a software upgrade then if you wish to do that
>> based on the information of a certain image variant. I mean, it will
>> lead to more manageable and reproducable images.
>>
>> It is possible that I am not aware of something important, so please
>> enlighten me. It would be nice to see how other OE users do a system
>> upgrade.
>>
>> For instance, the MeeGo Nokia phone had a software version information
>> in the settings, and that is something I would personally consider as
>> the image version, but again, there might be better ways. Please share
>> good practices in here., or alternatively, feel free to point me to
>> any documentation, examples, etc.
>
> You can have a product-version recipe which populates it based on the
> information you need (write it in a file in /etc and change PV as
> need). That way you can even track this using buildhistory. We do it
> for several products and it works quite well.
>
> All the need structure for it to work is avaiblue, just make the
> recipes in your product layer.

Is your layer available in the open for further study? If not, can you
give a minimal example?

I personally feel separate recipe for a version number a bit too much
for this. I would prefer a variable for it, like "PRODUCT_VERSION" or
so. I think, that would be gratifying.

