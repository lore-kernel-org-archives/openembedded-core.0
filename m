Return-Path: <josep.puigdemont@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id AF044609C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 11:35:54 +0000 (UTC)
Received: from iapetus.enea.se (172.16.141.118) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 17 Apr 2014 13:35:54 +0200
Date: Thu, 17 Apr 2014 13:35:54 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Gabriel Barbu <Gabriel.Barbu@enea.com>
Message-ID: <20140417113554.GE1852@iapetus.enea.se>
References: <69319FFFA2D4F748B9BB5083FA28E56F25B9AD1A@sestoex09.enea.se>
MIME-Version: 1.0
In-Reply-To: <69319FFFA2D4F748B9BB5083FA28E56F25B9AD1A@sestoex09.enea.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to add a distro feature from an image recipe?
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
X-List-Received-Date: Thu, 17 Apr 2014 11:35:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 17, 2014 at 11:27:16AM +0000, Gabriel Barbu wrote:
> Hi,
> 
>  
> 
> Is there a specific mechanism to add a distro feature from an image recipe?
> 
> DISTRO_FEATURES_append does not seem to work from an image-*.bb or from a
> packagegroup-*.bb.
>  
> 
> Or, if not, what would be the best way to achieve this?
> 
> The need is that I have a number of images and only want to add a certain
> distro feature (ptest) to just one or two of them (some test images).

Couldn't that be achieved by just adding "ptest-pkgs" to IMAGE_FEATURES in the
image recipe? or "ptest-pkgs" to EXTRA_IMAGE_FEATURES in your local.conf?

/Josep

> 
>  
> 
> Thanks,
> 
>  
> 
> Gabriel
> 
>  
> 


