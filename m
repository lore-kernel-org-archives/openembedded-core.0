Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U6SE8-00079E-1u
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 21:49:49 +0100
Received: by mail-ve0-f170.google.com with SMTP id 14so3439965vea.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 12:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ILt3jdUaumV3/Z3OXQbiyi3RUnDeT01kxqA7eIzaTf4=;
	b=heK1YmaqQx1sEQUr+qzkN19njZAPGdIY8URmHJHoVdcV2qGRw6XagEEZrWBncEjtLH
	lDlk4q6qmQJrkVXJXXYA4KeTaWHFzbWaNzpUwrcLi+AyHGvujU62qExClSDA2+HczsvR
	wLBo0go4lwA2nQ3QeUkuhnXtEHULFZu4Yx5u2QWmE+AiNWeHOjo9TkX4RhgkYag1A8wS
	bvy5jfB/yZPUp8cAefUmaB1NfZLmAuU2cDyB55+UJFEtHeLh/jr54WJHZXgV3VT+lp6w
	M/KgU7a3EWy/CVXlVRFOFq8sILmGiBA16LWCGXAY4pLFFZRAH+XZcylZKjXN7d1C/G9B
	UHTA==
X-Received: by 10.52.32.69 with SMTP id g5mr260487vdi.81.1360960423671; Fri,
	15 Feb 2013 12:33:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Fri, 15 Feb 2013 12:33:23 -0800 (PST)
In-Reply-To: <1360956550-31119-1-git-send-email-raj.khem@gmail.com>
References: <1360956550-31119-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Feb 2013 20:33:23 +0000
Message-ID: <CAJTo0LY7zkGkAc4XR_7yp1R-=WZbRA=M7xoo9EiYMpYjGkOaTw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQk2JMNOaJx8xS8AYp6meCanj/PzUzW7W4OoVOW2kmHAtt4L4Gk4Atbsz5kvicf+/9dcE6ee
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Fix packaging warnings and spin libnss_myhostname to package of its own
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
X-List-Received-Date: Fri, 15 Feb 2013 20:49:49 -0000
Content-Type: text/plain; charset=UTF-8

On 15 February 2013 19:29, Khem Raj <raj.khem@gmail.com> wrote:
> +                /lib/udev/hwdb.d \

Would this obsolete the patch I posted earlier to add pci/usb IDs?

Ross


