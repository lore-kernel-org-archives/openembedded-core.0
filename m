Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 80BA36EC47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 11:51:08 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 14 Feb 2014 12:51:02 +0100
Message-ID: <52FE0323.7050703@enea.com>
Date: Fri, 14 Feb 2014 12:50:59 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Andreea Proca <andreea.b.proca@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1392303990.git.andreea.b.proca@intel.com>
In-Reply-To: <cover.1392303990.git.andreea.b.proca@intel.com>
X-Originating-IP: [172.16.141.133]
Subject: Re: [PATCH 0/1] Error reporting tool
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
X-List-Received-Date: Fri, 14 Feb 2014 11:51:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-02-13 16:28, Andreea Proca wrote:
>
> Hello,
>
> This patch together with the web app from git://git.yoctoproject.org/error-report-web
> form an error reporting system similar to kernel-oops service.
> This tool proposes a way of keeping track of the errors appeared during builds
> by dumping the debug information of the build into a database which can be analyzed.
>
> The data collected consists of the log file of the tasks that failed and common configuration variables
> (such as machine, distro, host distro, etc as well as the version of the build system - branch/commit id, which
> is commonly missing from bug reports :) ).
> The project will benefit from the multitude of build results published by quickly identifying the issues and the areas of interest for the contributors.
> The objectives of the application were achieved by creating a client-server system. The client (basically this bitbake class) collects all the information needed
> for solving the errors and the server receives that data and saves in a database (see the Django web app at git://git.yoctoproject.org/error-report-web).
>
> All the debug information collected during a build which failed is stored on the user's machine, in a JSON format and its path is displayed
> in the output of the build as well as the command that the contributor can run a script to send the error report file to the server. The
> script will give the user a link corresponding to his entry in the database. The scripts accepts a parameter which is the hostname
> to the web app instance (by default it's localhost).
> Contributors can search by certain configurations (e.g. machine, component, error, task) and see statistics through the web interface.
>
>
> Thanks,
> Andreea
>

+1
Good initiative !

kerneloops-daemon/www.kerneloops.org for bitbake as far as I understand 
the explanation above.

Br,
David

