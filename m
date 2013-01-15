Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TvDEJ-00005Z-0y
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:35:42 +0100
Received: from mail-pb0-f72.google.com ([209.85.160.72])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 15 Jan 2013 12:19:05 -0800
Received: by mail-pb0-f72.google.com with SMTP id wz7so634352pbc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 12:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:message-id:date:from:user-agent:mime-version
	:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=DxWY2JlV2xjBl5nPT0IZTq0L+ZgMc5ahpVdF4NHz8w8=;
	b=hHiwFV57o8HtFU80/+2/a51j6x2aKc8D8Jc/0foP4tr0W7IllZmud3SCx/rTbreCOF
	vxTWCiXfsG29sWvglnDcsvi15hu68g/1NwZcCq2WIsiMUGOqGEmFkrIeUXoE+6WAOuUC
	vgF7wxd/1qNhkheGdyvclEvlr+6Inc2ncP1Crowhz9WHZumIWFTSwbkU1lHlm1mZ+iJD
	4ZzehCS5IAGQhxnbCO9WY8qpsdOQ7VPAsbl+0b98OXe72UBqTrHY8vi64T+B84hXT37C
	PnEPTIgzWlrfEI0PJ7BngAk0ird8w8aNiefqp8He0qhISBBSemD8iuZs6kzNdCR8iKXl
	/VdQ==
X-Received: by 10.68.230.200 with SMTP id ta8mr264942891pbc.13.1358281140696; 
	Tue, 15 Jan 2013 12:19:00 -0800 (PST)
X-Received: by 10.68.230.200 with SMTP id ta8mr264942866pbc.13.1358281140534; 
	Tue, 15 Jan 2013 12:19:00 -0800 (PST)
Received: from [10.1.10.13] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id gu5sm10775950pbc.10.2013.01.15.12.18.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 12:18:59 -0800 (PST)
Message-ID: <50F5B9B2.20909@intel.com>
Date: Tue, 15 Jan 2013 12:18:58 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1358241880-3921-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1358241880-3921-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm+NqM8xFXCFYMaKZ7a7I03zo3WzkqYNV+SRY1XjvPceuqInMvVGZ1qbGl2O/PSEST6DpX1l8zkhInYQHIPArGY9Iub/EutldMFrOdEKvmy0vKYMdfH7G9KqmmpiM6OXkEoW8QlbBQGM4jSqTzURH1jSO5kbh6OlWwLvEv1Slmjgj39XNi0eAQLcZD79sZhK82uRElH
Subject: Re: [for-denzil][Fedora 18 fixes][PATCH 1/4] bison: move remove-gets.patch to BASE_SRC_URI, it's needed for bison-native too if host has (e)glibc-2.16
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
X-List-Received-Date: Tue, 15 Jan 2013 20:35:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Koen,

Thanks for these patches. With denzil 1.2.2 just having gone through 
final QA fullpass testing, the team has decided during the Technical 
Team Meeting today that we will not hold up the 1.2.2 release further, 
but instead perform the usual Autobuilder testing on them and submit 
them to the tip of the denzil branch.

So these patches (as well as Matthew McClintock's recent denzil patches) 
will not be included in 1.2.2 but I will work to get them into the 
denzil branch, so they are easily available to the folks who will need them.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


