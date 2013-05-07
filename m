Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UZfQm-000806-QL
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:47:37 +0200
Received: from [10.1.14.186] (83-64-248-68.inzersdorf.xdsl-line.inode.at
	[83.64.248.68]) by ptmx.org (Postfix) with ESMTPSA id 3D82A21013;
	Tue,  7 May 2013 12:29:38 +0200 (CEST)
Message-ID: <5188D791.1070505@pseudoterminal.org>
Date: Tue, 07 May 2013 12:29:37 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1367787030-5056-1-git-send-email-dv@pseudoterminal.org>
	<CAJTo0LZrtVHq4PpF4uEL+_GeQBzDOMTEu-rt39j7agamGOe+MQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZrtVHq4PpF4uEL+_GeQBzDOMTEu-rt39j7agamGOe+MQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer: Fixed dependency problem with -meta packages
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
X-List-Received-Date: Tue, 07 May 2013 10:47:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2013 11:55 AM, Burton, Ross wrote:
> On 5 May 2013 21:50, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
>> Installing the gstreamer -meta packages was not possible, because the
>> -apps and -glib packages were missing. Allowing for empty -apps/glib
>> packages fixes this.
>  From what I can tell there's only one -apps package
> (gst-plugins-base-apps) and one -glib package (gst-plugins-bad-glib),
> so why not add those extra dependencies in -base and -bad explicitly
> instead of creating empty packages for no reason?
>
> Ross

True, however I wonder if somebody relies on these packages being there.
Is it acceptable to break compatibility here?


