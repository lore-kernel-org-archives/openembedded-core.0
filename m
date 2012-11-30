Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeOmR-0005TC-8E
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 12:29:16 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so404599ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 03:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ra/e+DYBm6nWUHhs1yUZXiVr1f1rkiym1C5A44hngqc=;
	b=F6DDTVWtjrpINyYraXTAKJ+l3pPtUj2hRQrIMHWcb7oirHet0SAzGeWS/Fs+Z0xXeS
	eBot42fGxpcB5LEHHTbLLutJLSb1JYEIh4dtNnbzaQMeTsao7UgZPr16oHj1Sa5r8aNN
	QnUmVRVJuuJ56FCk0oqSpSSmwMFXUPZlOqcGDWjfQC3iD/ZhSzSLw10iPJDuvs00QVql
	XG8kIoA9rxtUmuNZ2pwlGa/U/6tWNbtjBgCJcbJqg8oQ+QtFjo9oYHIKoMaHEP4lcQAN
	Mohd75kmTqrVPyULmFiavn0NMaqnDVLxvaRzstvMu/2wmVzKOoPn+0Kz0mjNA+R7mXlq
	GMdg==
MIME-Version: 1.0
Received: by 10.50.153.169 with SMTP id vh9mr642575igb.67.1354274097687; Fri,
	30 Nov 2012 03:14:57 -0800 (PST)
Received: by 10.64.24.175 with HTTP; Fri, 30 Nov 2012 03:14:57 -0800 (PST)
In-Reply-To: <1354273734-7103-1-git-send-email-cazfi74@gmail.com>
References: <1354273734-7103-1-git-send-email-cazfi74@gmail.com>
Date: Fri, 30 Nov 2012 13:14:57 +0200
Message-ID: <CAF6bG8fYO6Ent8JqYyfo+oqScYytWqbuYCRh=VyKS=c3zmtqGA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: update to upstream version 8.20
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 11:29:16 -0000
Content-Type: text/plain; charset=UTF-8

On 30 November 2012 13:08, Marko Lindqvist <cazfi74@gmail.com> wrote:
> * License texts are identical to old, but old md5sum was
>   erronously calculated from the beginning of the ls.c file, and
>   not from the beginning of license text segment.

Google finds quite a lot of documentation/examples to use startline=x
when it seems to be beginline=x which works. Judging from output of
"grep -r startline openembedded-core", there are several other
affected recipes. I can make patchset to replace those with
"beginline" and corrent md5sums.


 - ML


