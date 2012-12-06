Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Tggeb-0008IU-9H
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 19:58:39 +0100
Received: from mail-qc0-f197.google.com ([209.85.216.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 06 Dec 2012 10:43:13 -0800
Received: by mail-qc0-f197.google.com with SMTP id x40so10018405qcs.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 10:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=Xfv4VpLIyQx9mtayM74Mbvt7bKP4qPOAxvrJ9Y6JlS0=;
	b=CKvrxJgGYWrRKzwymzv8TEaW4ZUKxucup69f+0zo7E9Z+0XOtduzb+MRoLdcEhufKg
	JqUSrErvCAJbSSeIj4N7G/GU37a+2JzGXOoWCHyrJHX8NaQD6/RKrWCtX9l/pAnq8cyU
	C+/yz8V8hDAQPyclnpgEbukgSAsqMqxPSjhpmfildt7CCvCbObRLcNtgnd64yq+Org+y
	Ohnp8s5GepX45EO+3thUgVrsXmOrbq6ZJGbAcBmJ0A1u/SrN5tNvkyYrJrTkR6nJGj+E
	ul6HZfqfwQbqBqokiNYjhJdbaiLUhhw09N0L9yDZ479Ef4hpbA9EU9wS7xUWL5iywP4V
	jtXA==
Received: by 10.49.60.33 with SMTP id e1mr4670882qer.4.1354819436100;
	Thu, 06 Dec 2012 10:43:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.49.60.33 with SMTP id e1mr4670848qer.4.1354819435716; Thu, 06
	Dec 2012 10:43:55 -0800 (PST)
Received: by 10.49.12.136 with HTTP; Thu, 6 Dec 2012 10:43:55 -0800 (PST)
In-Reply-To: <CAP9ODKp_YuFAKA8xS72DM_MtuZnMRBpengyi656p30oJ0EuJvQ@mail.gmail.com>
References: <cover.1354748735.git.elizabeth.flanagan@intel.com>
	<18ff48823dac8258feb94958f9ebe3dcaab32815.1354748735.git.elizabeth.flanagan@intel.com>
	<CAP9ODKp_YuFAKA8xS72DM_MtuZnMRBpengyi656p30oJ0EuJvQ@mail.gmail.com>
Date: Thu, 6 Dec 2012 10:43:55 -0800
Message-ID: <CAPhnLPC5rwLd5b6vspJPLEcrwJfC+VPGJirz-huMtwMb1svf8w@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQkmS+BeMVijowyfA2dgrk9aQhVIQD2fC1YVNl65IFC9vx690YoFJ8SzmoWyH6xZoeAuig71ilb3WjTG6DSIjNl3ab7CfRO0xB842xtMB0U3tpvgSVhyljpTsHAj2/UWeYdprf99/LV2xZYtMY7Zk79peYjD+Q6pQpQMjMQa/RLYXzES1gGKDl4/327omfI73tBL6u0w
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] license.bbclass: Including locale packages
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
X-List-Received-Date: Thu, 06 Dec 2012 18:58:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 6, 2012 at 4:01 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>
>
> On Wed, Dec 5, 2012 at 9:37 PM, Elizabeth Flanagan
> <elizabeth.flanagan@intel.com> wrote:
>>
>> As locale packages are installed on the image, we should
>> be including them in the package/license manifest.
>>
>> This ensures that the manifests are accurate and complete.
>>
>> [ YOCTO #2461 ]
>>
>> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
>
>
> Do you see any problem in it being add to danny as well?
>

If it applies cleanly, no, I don't see an issue. It may not apply
clean though, so we may need to cherry-pick a few commits.

-b

> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


