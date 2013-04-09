Received: from mail-oa0-f53.google.com ([209.85.219.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPZw2-0005Eo-MO
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:54:12 +0200
Received: by mail-oa0-f53.google.com with SMTP id m17so7371675oag.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=9MqXuILafztasw2V6qYNj+UhCeAI4WtQ30FlXeRYUm8=;
	b=THrjHRYP7Evu7/oFq60w5btiLTNkFIQlauaf85bu1bkz5LRRAD5SyZlcaJ0+y+QW8A
	9cMQqJj52EQnv1XcfrE08i5CxF9ZAE5HVLYK/uGXkG/LmvZpoy/b1xSxfm6Q/lUBmFMp
	mQIMrS/HvFhkwjXItd1UD/iAOQxQ4EUYdxoqcYIxuMqv90qU/SzAsszQLFrLkCQZ7Qvj
	RtdWdPGej+Me1oca9sRCm89n+Lw2wrZWXnG2JHZga1xrnVl6Y4SChDwxfSKXapykgl0k
	3rtAaw4O5Dt5Btx0snCvIorTOpmL2qykTB3RYWOQx3NB0/h3Lxj5ktwZRFJHXKiMxWbB
	w8IQ==
MIME-Version: 1.0
X-Received: by 10.182.205.169 with SMTP id lh9mr18763000obc.86.1365518209963; 
	Tue, 09 Apr 2013 07:36:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 9 Apr 2013 07:36:49 -0700 (PDT)
In-Reply-To: <1365510909.12407.79.camel@ted>
References: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
	<1365510909.12407.79.camel@ted>
Date: Tue, 9 Apr 2013 11:36:49 -0300
X-Google-Sender-Auth: VbSdDk7uhw5XngxDdDM5K0UZryQ
Message-ID: <CAP9ODKqEJCS56UaKT3M1cPpA-escn5f7d_kEBL2kasnLYN2avQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] udev: Move udevd back to /sbin
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
X-List-Received-Date: Tue, 09 Apr 2013 14:54:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 9, 2013 at 9:35 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-04-08 at 19:29 +0300, Radu Moisan wrote:
>> Along with v182 upgrade udevd was moved to ${base_libdir}
>> making scripts like init-live.sh to fail in finding udevd
>>
>> Fixes [Yocto #4046]
>>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> ---
>>  meta/recipes-core/udev/udev.inc    |    3 ++-
>>  meta/recipes-core/udev/udev_182.bb |    2 +-
>>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> We needed a decision on this. I've rewritten the commit message and
> merged it. Most of the feedback was about the commit message, not the
> patch itself. There were also no better proposals for how we could
> actually fix the bugs we were seeing.

If I read the thread right, it had two NACK's. So it wasn't a cosmetic
commit log issue.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


