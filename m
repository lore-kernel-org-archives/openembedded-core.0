Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RZtaW-0007LH-KL
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 01:17:48 +0100
Received: by qcqw6 with SMTP id w6so3170251qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2011 16:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=CkMhS2yZlKVv3rSb29vYAr1tIqNZek4IiBk4UkWhD4o=;
	b=Oc6OlK/YDuEIVhU2sDXd4JBlP5ghqnPjlNHQ/VlYB6Le9hydkIXfjYTk6EhiN/vxMO
	0rCYYY+LgJ0OfQBwr7CBUxMKxc8EBiyYBrggA1kx7EfL0Rr6O+gjAexPlk60Oy5d/Lk9
	4lvKEB5ZXeJJyMVt/4VsoFi3aZMS4BrU96dS8=
Received: by 10.224.203.202 with SMTP id fj10mr15208438qab.66.1323648654331;
	Sun, 11 Dec 2011 16:10:54 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.73.200 with HTTP; Sun, 11 Dec 2011 16:10:33 -0800 (PST)
In-Reply-To: <CAEsOVNd8AsZNrzcsP4RsK0zURAkkh7hJ6W=BwNKVRnkADxDEhg@mail.gmail.com>
References: <1323419740.1294.70.camel@localhost.localdomain>
	<CAEsOVNd8AsZNrzcsP4RsK0zURAkkh7hJ6W=BwNKVRnkADxDEhg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 11 Dec 2011 17:10:33 -0700
X-Google-Sender-Auth: w4Q_rdJZ3UmpwxqmoxSpkHPONtY
Message-ID: <CABcZANnsd0srVep_NSsuFZrGrF2KZocP1EUw3U+fMtTMPpWfvg@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: inheirt multi bbclass using variable
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
X-List-Received-Date: Mon, 12 Dec 2011 00:17:48 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 11, 2011 at 4:45 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Fri, Dec 9, 2011 at 2:35 AM, Ni Qingliang <niqingliang@insigma.com.cn> wrote:
>> I'm trying to inherit multi bbclass using variable:
>>
>> IMAGE_EXTRA_CLASSES = "image-timezone image-clearboot image-prd"
>> inherit ${IMAGE_EXTRA_CLASSES}
>>
>> and got error:
>> ERROR: Could not inherit file classes/image-timezone image-clearboot
>> image-prd.bbclass
>>
>> why it treat the variable as a single class?
>> how to resolve the problem?
>
> There are some issues with inherit. I've seen a similar issue with:
>
> IMAGE_EXTRA_CLASSES = ""
> inherit ${IMAGE_EXTRA_CLASSES}
>
> ERROR: Could not inherit file classes/.bbclass

To be fair, in this case, it's doing exactly what you told it to do --
inherit an empty string.
-- 
Christopher Larson


